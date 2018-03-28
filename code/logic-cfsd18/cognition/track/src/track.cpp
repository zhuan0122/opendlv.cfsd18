/**
* Copyright (C) 2017 Chalmers Revere
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public License
* as published by the Free Software Foundation; either version 2
* of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301,
* USA.
*/

#include <iostream>

#include <opendavinci/odcore/data/TimeStamp.h>
#include <opendavinci/odcore/strings/StringToolbox.h>
//#include <opendavinci/odcore/wrapper/Eigen.h>

#include <thread>

#include "track.hpp"

namespace opendlv {
namespace logic {
namespace cfsd18 {
namespace cognition {

Track::Track(int32_t const &a_argc, char **a_argv) :
  DataTriggeredConferenceClientModule(a_argc, a_argv, "logic-cfsd18-cognition-track"),
  m_groundSpeed{0.0f},
  m_surfaceCollector{},
  m_newFrame{true},
  m_lastObjectId{0},
  m_timeDiffMilliseconds{1},
  m_groundSpeedMutex{},
  m_surfaceMutex{},
  m_pathMutex{}
{
  m_surfaceCollector = Eigen::MatrixXf::Zero(1000,2); // TODO: how big?
}

Track::~Track()
{
}

void Track::nextContainer(odcore::data::Container &a_container)
{
  if (a_container.getDataType() == opendlv::proxy::GroundSpeedReading::ID()) {
    odcore::base::Lock lockGroundSpeed(m_groundSpeedMutex);
    auto groundSpeed = a_container.getData<opendlv::proxy::GroundSpeedReading>();
    m_groundSpeed = groundSpeed.getGroundSpeed();

  }

  if (a_container.getDataType() == opendlv::logic::perception::GroundSurfaceArea::ID()) { //TODO: New message + path collector

    auto groundSurfaceArea = a_container.getData<opendlv::logic::perception::GroundSurfaceArea>();
    uint32_t objectId = groundSurfaceArea.getSurfaceId();

    {
      odcore::base::Lock lockSurface(m_surfaceMutex);
      //Check last timestamp if they are from same message
      m_lastObjectId = (m_lastObjectId<objectId)?(objectId):(m_lastObjectId);
      m_surfaceCollector(2*objectId,0) = groundSurfaceArea.getX1();
      m_surfaceCollector(2*objectId,1) = groundSurfaceArea.getY1();
      m_surfaceCollector(2*objectId+1,0) = groundSurfaceArea.getX2();
      m_surfaceCollector(2*objectId+1,1) = groundSurfaceArea.getY2();
    }
    if (m_newFrame){
      std::thread surfaceCollector (&Track::collectAndRun,this); //just sleep instead maybe since this is unclear how it works
      surfaceCollector.detach();
      m_newFrame = false;
    }

  }
  // TODO: logic for different states, start and stop
  /*
  if (a_container.getDataType() == opendlv::system::SignalStatusMessage::ID()) {
    // auto kinematicState = a_container.getData<opendlv::coord::KinematicState>();
  }
  if (a_container.getDataType() == opendlv::system::SystemOperationState::ID()) {
    // auto kinematicState = a_container.getData<opendlv::coord::KinematicState>();
  }
  if (a_container.getDataType() == opendlv::system::NetworkStatusMessage::ID()) {
    // auto kinematicState = a_container.getData<opendlv::coord::KinematicState>();
  }
  */

}

void Track::setUp()
{
}

void Track::tearDown()
{
}

void Track::collectAndRun(){
  //std::this_thread::sleep_for(std::chrono::duration 1s); //std::chrono::milliseconds(m_timeDiffMilliseconds)

  bool sleep = true;
  auto start = std::chrono::system_clock::now();

  while(sleep)
  {
    auto now = std::chrono::system_clock::now();
    auto elapsed = std::chrono::duration_cast<std::chrono::microseconds>(now - start);
    if ( elapsed.count() > m_timeDiffMilliseconds*1000 )
        sleep = false;
  }

  Eigen::MatrixXf localPath;
  {
    odcore::base::Lock lockSurface(m_surfaceMutex);
    odcore::base::Lock lockPath(m_pathMutex);
    localPath = m_surfaceCollector.topRows(m_lastObjectId+1);
    m_newFrame = true;
    m_lastObjectId = 0;
    m_surfaceCollector = Eigen::MatrixXf::Zero(1000,2); // TODO: how big?
  }
  //################ RUN and SEND ##################
  if(localPath.rows() > 0){ // TODO: Check for bad path

    float groundSpeedCopy;
    {
      odcore::base::Lock lockGroundSpeed(m_groundSpeedMutex);
      groundSpeedCopy = m_groundSpeed;
    }
    float const previewTime = 1;
    float const velocityLimit = 10;
    float const lateralAccelerationLimit = 2*9.81;
    float const accelerationLimit = 5; //TODO: dynamic limit?
    float const decelerationLimit = -5;
    float const headingErrorDependency = 0; // > 0 limits desired velocity for heading errors > 0

    Eigen::MatrixXf localPathCopy;
    {
    odcore::base::Lock lockPath(m_pathMutex);
    localPathCopy = localPath;
    }
    float headingRequest = Track::driverModelSteering(localPathCopy, groundSpeedCopy, previewTime);
    float accelerationRequest = Track::driverModelVelocity(localPathCopy, groundSpeedCopy, velocityLimit, lateralAccelerationLimit, accelerationLimit, decelerationLimit, headingRequest, headingErrorDependency);

    opendlv::logic::action::AimPoint o1;
    o1.setAzimuthAngle(headingRequest);
    odcore::data::Container c1(o1);
    getConference().send(c1);

    if (accelerationRequest >= 0.0f) {
      opendlv::proxy::GroundAccelerationRequest o2;
      o2.setGroundAcceleration(accelerationRequest);
      odcore::data::Container c2(o2);
      getConference().send(c2);
    }
    else if(accelerationRequest < 0.0f){
      opendlv::proxy::GroundDecelerationRequest o3;
      o3.setGroundDeceleration(accelerationRequest);
      odcore::data::Container c3(o3);
      getConference().send(c3);
    }
  }
}

float Track::driverModelSteering(Eigen::MatrixXf localPath, float groundSpeedCopy, float previewTime) {
  //driverModelSteering calculates the desired heading of CFSD18 vehicle
  // given the vehicles velocity, a set time to aimpoint and a path in local
  // coordinates (vehicle is origo).
  //
  //Input
  //   LOCALPATH               [n x 2] Local coordinates of the path [x,y]
  //   GROUNDSPEEDCOPY         [1 x 1] Velocity of the vehicle [m/s]
  //   PREVIEWTIME             [1 x 1] Time to aimpoint [s].
  //
  //Output
  //   HEADINGREQUEST  [1 x 1] Desired heading angle [rad]

  // Calculate the distance between vehicle and aimpoint;
  float previewDistance = groundSpeedCopy*previewTime;
  //Distance to aimpoint is currently calculated only on path, Not from vehicle
  float sumPoints = 0.0f;
  // Sum the distance between all path points until passing previewDistance
  // or reaching end of path
  int k=0;
  while (previewDistance >= sumPoints && k < localPath.rows()) {
    sumPoints += (localPath.row(k+1)-localPath.row(k)).norm();
    k++;
  }

  Eigen::Vector2f aimPoint(2);
  if (sumPoints >= previewDistance) { // it means that the path is longer than previewDistance
    float distanceP1P2, overshoot, distanceP1AimPoint;
    if (k > 0) {// then the aimpoint will be placed after the first path element
      // Distance between last two considered path elements P1 P2 where P2 is the overshoot element.
      distanceP1P2 = (localPath.row(k+1)-localPath.row(k)).norm();
      // Difference between distance to aimpoint and summed points.
      overshoot = sumPoints - previewDistance;
      // Distance between next to last considered path element P1 and aimpoint
      distanceP1AimPoint = distanceP1P2 - overshoot;
      // Linear interpolation
      aimPoint = (localPath.row(k+1)-localPath.row(k))*(distanceP1AimPoint/distanceP1P2) + localPath.row(k);
    }
    else {// not needed if sumPoints is initialized as zero, (and previewDistance>0)

      distanceP1P2 = localPath.row(0).norm(); // Distance is equal to the distance to the first point;
      overshoot = sumPoints - previewDistance;
      distanceP1AimPoint = distanceP1P2 - overshoot;
      aimPoint = localPath.row(0)*(distanceP1AimPoint/distanceP1P2);
    }
  }
  // If the path is too short, place aimpoint at the last path element
  else {
    aimPoint = localPath.row(localPath.rows()-1);
  }
  // Angle to aimpoint
  float headingRequest;
  headingRequest = atan2(aimPoint(1),aimPoint(0));

  return headingRequest;
}

float Track::driverModelVelocity(Eigen::MatrixXf localPath, float groundSpeedCopy, float velocityLimit, float lateralAccelerationLimit, float accelerationLimit, float decelerationLimit, float headingRequest, float headingErrorDependency){
  //driverModelVelocity calculates the desired acceleration of the CFSD18
  //vehicle.
  //
  //Input
  //   LOCALPATH                   [n x 2] Local coordinates of the path [x,y]
  //   GROUNDSPEEDCOPY             [1 x 1] Velocity of the vehicle [m/s]
  //   VELOCITYLIMIT               [1 x 1] Maximum allowed velocity [m/s]
  //   LATERALACCELERATIONLIMIT    [1 x 1] Allowed lateral acceleration [m/s^2]
  //   ACCELERATIONLIMIT           [1 x 1] Allowed longitudinal acceleration (positive) [m/s^2]
  //   DECELERATIONLIMIT           [1 x 1] Allowed longitudinal acceleration (negative) [m/s^2]
  //   HEADINGREQUEST              [1 x 1] Heading error to aimpoint [rad]
  //   HEADINGERRORDEPENDENCY      [1 x 1] Constant
  //
  //Output
  //   ACCELERATIONREQUEST         [1 x 1] Signed desired acceleration

  // Caluclate curvature of path
  Eigen::VectorXf curveRadii = curvature(localPath);
  // Set velocity candidate based on expected lateral acceleration limit
  Eigen::VectorXf speedProfile(localPath.rows()-2,1);
  for (int k = 0; k < localPath.rows()-2; k++){
  speedProfile(k) = std::min(sqrtf(lateralAccelerationLimit*curveRadii(k)),velocityLimit);
  }

  // Back propagate the whole path and lower velocities if deceleration cannot
  // be achieved.
  for (int k = speedProfile.rows()-1; k > 0 ; k-=1) {
    // Distance between considered path points
    float pointDistance = (localPath.row(k+1)-localPath.row(k)).norm();
    // Time between points if using averaged velocity
    float timeBetweenPoints = pointDistance/((speedProfile(k)+speedProfile(k-1))/2); //Using the highest velocity is safer?
    // Requiered acceleration to achieve velocity of following point from previous point
    float requieredAcceleration = (speedProfile(k)-speedProfile(k-1))/timeBetweenPoints;
    // If deceleration is needed
    if (requieredAcceleration < 0.0f) {
      // If deceleration can't be achieved by braking...
      if (requieredAcceleration < decelerationLimit) {
        // Set deceleration to max achivable deceleration (vehicle specific)
        // Calculate new velocity
        speedProfile(k-1) = sqrtf(powf(speedProfile(k),2)-2.0f*decelerationLimit*pointDistance); // time based on average(v2-v1)/2
      }
    }
  }
  // Choose velocity to achieve
  // Limit it dependent on the heading request (heading error)
  float desiredVelocity = speedProfile(0)/(1.0f + headingErrorDependency*abs(headingRequest));
  // Calculate time to desired velocity
  float timeToVelocity = (localPath.row(1)).norm()/((groundSpeedCopy+desiredVelocity)/2);
  // Transform into acceleration
  float accelerationRequest = (desiredVelocity-groundSpeedCopy)/timeToVelocity;
  // Limit acceleration request for positive acceleration
  if (accelerationRequest > 0.0f && accelerationRequest > accelerationLimit) {
    accelerationRequest = accelerationLimit;
  }
  // Limit acceleration request for negative acceleration
  if (accelerationRequest < 0.0f && accelerationRequest < decelerationLimit) {
    accelerationRequest = decelerationLimit;
  }

  return accelerationRequest;
}

Eigen::VectorXf Track::curvature(Eigen::MatrixXf localPath){ //TODO: replace curvature estimation
  // Segmentize the path and calculate radius of segments
  // - First radius is calculated at 2nd path point
  // - Last radius is calculated at 2nd to last path point
  // Note! 3 points in a row gives infinate radius.
  Eigen::VectorXf curveRadii(localPath.rows()-2,1);
  int step = 1;
  for (int k = 0; k < localPath.rows()-(2*step); k++) {
    // Choose three points and make a triangle with sides A(p1p2),B(p2p3),C(p1p3)
    float A = (localPath.row(k+step)-localPath.row(k)).norm();
    float B = (localPath.row(k+2*step)-localPath.row(k+step)).norm();
    float C = (localPath.row(k+2*step)-localPath.row(k)).norm();

    // sort side lengths as A >= B && B >= C
    if (A < B) {
        std::swap(A, B);
    }
    if (A < C) {
        std::swap(A, C);
    }
    if (B < C) {
        std::swap(B, C);
    }

    if (C-(A-B) <= 0) {
      //std::cout << "WARNING! The data are not side-lengths of a real triangle" << std::endl;
      curveRadii(k) = 10000; // Large radius instead of inf value will reach velocitylimit
    }
    else {
      // https://people.eecs.berkeley.edu/~wkahan/Triangle.pdf
      // Calculate triangle area
      float triangleArea = 0.25f*sqrtf((A+(B+C))*(C-(A-B))*(C+(A-B))*(A+(B-C)));
      // Calculate the radius of the circle that matches the points
      curveRadii(k) = (A*B*C)/(4*triangleArea);
    }
  }
  return curveRadii;
}






}
}
}
}

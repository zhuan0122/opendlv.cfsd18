# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /opt/opendlv.cfsd18.sources/code/logic-cfsd18

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build

# Include any dependencies generated for this target.
include cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/depend.make

# Include the progress variables for this target.
include cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/progress.make

# Include the compile flags for this target's objects.
include cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/flags.make

cognition/track/tracktestsuite.hpp-TestSuite.cpp: /opt/opendlv.cfsd18.sources/code/logic-cfsd18/cognition/track/testsuites/tracktestsuite.hpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating tracktestsuite.hpp-TestSuite.cpp"
	cd /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/cognition/track && /usr/bin/python2.7 /opt/opendlv.cfsd18.sources/thirdparty/cxxtest/cxxtestgen --xunit-printer --have-eh --world=opendlv-logic-cfsd18-cognition-track-tracktestsuite.hpp -o /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/cognition/track/tracktestsuite.hpp-TestSuite.cpp /opt/opendlv.cfsd18.sources/code/logic-cfsd18/cognition/track/testsuites/tracktestsuite.hpp

cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/tracktestsuite.hpp-TestSuite.cpp.o: cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/flags.make
cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/tracktestsuite.hpp-TestSuite.cpp.o: cognition/track/tracktestsuite.hpp-TestSuite.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/tracktestsuite.hpp-TestSuite.cpp.o"
	cd /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/cognition/track && /usr/lib/ccache/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tracktestsuite.hpp-TestSuite.dir/tracktestsuite.hpp-TestSuite.cpp.o -c /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/cognition/track/tracktestsuite.hpp-TestSuite.cpp

cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/tracktestsuite.hpp-TestSuite.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tracktestsuite.hpp-TestSuite.dir/tracktestsuite.hpp-TestSuite.cpp.i"
	cd /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/cognition/track && /usr/lib/ccache/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/cognition/track/tracktestsuite.hpp-TestSuite.cpp > CMakeFiles/tracktestsuite.hpp-TestSuite.dir/tracktestsuite.hpp-TestSuite.cpp.i

cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/tracktestsuite.hpp-TestSuite.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tracktestsuite.hpp-TestSuite.dir/tracktestsuite.hpp-TestSuite.cpp.s"
	cd /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/cognition/track && /usr/lib/ccache/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/cognition/track/tracktestsuite.hpp-TestSuite.cpp -o CMakeFiles/tracktestsuite.hpp-TestSuite.dir/tracktestsuite.hpp-TestSuite.cpp.s

cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/tracktestsuite.hpp-TestSuite.cpp.o.requires:

.PHONY : cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/tracktestsuite.hpp-TestSuite.cpp.o.requires

cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/tracktestsuite.hpp-TestSuite.cpp.o.provides: cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/tracktestsuite.hpp-TestSuite.cpp.o.requires
	$(MAKE) -f cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/build.make cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/tracktestsuite.hpp-TestSuite.cpp.o.provides.build
.PHONY : cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/tracktestsuite.hpp-TestSuite.cpp.o.provides

cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/tracktestsuite.hpp-TestSuite.cpp.o.provides.build: cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/tracktestsuite.hpp-TestSuite.cpp.o


# Object files for target tracktestsuite.hpp-TestSuite
tracktestsuite_hpp__TestSuite_OBJECTS = \
"CMakeFiles/tracktestsuite.hpp-TestSuite.dir/tracktestsuite.hpp-TestSuite.cpp.o"

# External object files for target tracktestsuite.hpp-TestSuite
tracktestsuite_hpp__TestSuite_EXTERNAL_OBJECTS =

cognition/track/tracktestsuite.hpp-TestSuite: cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/tracktestsuite.hpp-TestSuite.cpp.o
cognition/track/tracktestsuite.hpp-TestSuite: cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/build.make
cognition/track/tracktestsuite.hpp-TestSuite: cognition/track/libopendlv-logic-cfsd18-cognition-track-static.a
cognition/track/tracktestsuite.hpp-TestSuite: /opt/od4/lib/libopendavinci.so
cognition/track/tracktestsuite.hpp-TestSuite: /usr/lib/x86_64-linux-gnu/librt.a
cognition/track/tracktestsuite.hpp-TestSuite: /opt/opendlv.core/lib/libodvdopendlvstandardmessageset.so
cognition/track/tracktestsuite.hpp-TestSuite: /opt/opendlv.lynx/lib/libodvdcfsd18.so
cognition/track/tracktestsuite.hpp-TestSuite: cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable tracktestsuite.hpp-TestSuite"
	cd /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/cognition/track && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tracktestsuite.hpp-TestSuite.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/build: cognition/track/tracktestsuite.hpp-TestSuite

.PHONY : cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/build

cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/requires: cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/tracktestsuite.hpp-TestSuite.cpp.o.requires

.PHONY : cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/requires

cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/clean:
	cd /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/cognition/track && $(CMAKE_COMMAND) -P CMakeFiles/tracktestsuite.hpp-TestSuite.dir/cmake_clean.cmake
.PHONY : cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/clean

cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/depend: cognition/track/tracktestsuite.hpp-TestSuite.cpp
	cd /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /opt/opendlv.cfsd18.sources/code/logic-cfsd18 /opt/opendlv.cfsd18.sources/code/logic-cfsd18/cognition/track /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/cognition/track /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : cognition/track/CMakeFiles/tracktestsuite.hpp-TestSuite.dir/depend


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
include sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/depend.make

# Include the progress variables for this target.
include sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/progress.make

# Include the compile flags for this target's objects.
include sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/flags.make

sensation/slam/slamtestsuite.hpp-TestSuite.cpp: /opt/opendlv.cfsd18.sources/code/logic-cfsd18/sensation/slam/testsuites/slamtestsuite.hpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating slamtestsuite.hpp-TestSuite.cpp"
	cd /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/sensation/slam && /usr/bin/python2.7 /opt/opendlv.cfsd18.sources/thirdparty/cxxtest/cxxtestgen --xunit-printer --have-eh --world=opendlv-logic-cfsd18-sensation-slam-slamtestsuite.hpp -o /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/sensation/slam/slamtestsuite.hpp-TestSuite.cpp /opt/opendlv.cfsd18.sources/code/logic-cfsd18/sensation/slam/testsuites/slamtestsuite.hpp

sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/slamtestsuite.hpp-TestSuite.cpp.o: sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/flags.make
sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/slamtestsuite.hpp-TestSuite.cpp.o: sensation/slam/slamtestsuite.hpp-TestSuite.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/slamtestsuite.hpp-TestSuite.cpp.o"
	cd /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/sensation/slam && /usr/lib/ccache/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/slamtestsuite.hpp-TestSuite.dir/slamtestsuite.hpp-TestSuite.cpp.o -c /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/sensation/slam/slamtestsuite.hpp-TestSuite.cpp

sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/slamtestsuite.hpp-TestSuite.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/slamtestsuite.hpp-TestSuite.dir/slamtestsuite.hpp-TestSuite.cpp.i"
	cd /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/sensation/slam && /usr/lib/ccache/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/sensation/slam/slamtestsuite.hpp-TestSuite.cpp > CMakeFiles/slamtestsuite.hpp-TestSuite.dir/slamtestsuite.hpp-TestSuite.cpp.i

sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/slamtestsuite.hpp-TestSuite.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/slamtestsuite.hpp-TestSuite.dir/slamtestsuite.hpp-TestSuite.cpp.s"
	cd /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/sensation/slam && /usr/lib/ccache/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/sensation/slam/slamtestsuite.hpp-TestSuite.cpp -o CMakeFiles/slamtestsuite.hpp-TestSuite.dir/slamtestsuite.hpp-TestSuite.cpp.s

sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/slamtestsuite.hpp-TestSuite.cpp.o.requires:

.PHONY : sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/slamtestsuite.hpp-TestSuite.cpp.o.requires

sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/slamtestsuite.hpp-TestSuite.cpp.o.provides: sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/slamtestsuite.hpp-TestSuite.cpp.o.requires
	$(MAKE) -f sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/build.make sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/slamtestsuite.hpp-TestSuite.cpp.o.provides.build
.PHONY : sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/slamtestsuite.hpp-TestSuite.cpp.o.provides

sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/slamtestsuite.hpp-TestSuite.cpp.o.provides.build: sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/slamtestsuite.hpp-TestSuite.cpp.o


# Object files for target slamtestsuite.hpp-TestSuite
slamtestsuite_hpp__TestSuite_OBJECTS = \
"CMakeFiles/slamtestsuite.hpp-TestSuite.dir/slamtestsuite.hpp-TestSuite.cpp.o"

# External object files for target slamtestsuite.hpp-TestSuite
slamtestsuite_hpp__TestSuite_EXTERNAL_OBJECTS =

sensation/slam/slamtestsuite.hpp-TestSuite: sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/slamtestsuite.hpp-TestSuite.cpp.o
sensation/slam/slamtestsuite.hpp-TestSuite: sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/build.make
sensation/slam/slamtestsuite.hpp-TestSuite: sensation/slam/libopendlv-logic-cfsd18-sensation-slam-static.a
sensation/slam/slamtestsuite.hpp-TestSuite: /opt/od4/lib/libopendavinci.so
sensation/slam/slamtestsuite.hpp-TestSuite: /usr/lib/x86_64-linux-gnu/librt.a
sensation/slam/slamtestsuite.hpp-TestSuite: /opt/opendlv.core/lib/libodvdopendlvstandardmessageset.so
sensation/slam/slamtestsuite.hpp-TestSuite: sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable slamtestsuite.hpp-TestSuite"
	cd /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/sensation/slam && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/slamtestsuite.hpp-TestSuite.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/build: sensation/slam/slamtestsuite.hpp-TestSuite

.PHONY : sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/build

sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/requires: sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/slamtestsuite.hpp-TestSuite.cpp.o.requires

.PHONY : sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/requires

sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/clean:
	cd /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/sensation/slam && $(CMAKE_COMMAND) -P CMakeFiles/slamtestsuite.hpp-TestSuite.dir/cmake_clean.cmake
.PHONY : sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/clean

sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/depend: sensation/slam/slamtestsuite.hpp-TestSuite.cpp
	cd /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /opt/opendlv.cfsd18.sources/code/logic-cfsd18 /opt/opendlv.cfsd18.sources/code/logic-cfsd18/sensation/slam /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/sensation/slam /opt/opendlv.cfsd18.build/logic-cfsd18-prefix/src/logic-cfsd18-build/sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : sensation/slam/CMakeFiles/slamtestsuite.hpp-TestSuite.dir/depend


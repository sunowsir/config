# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sunowsir/Code/1.GitHub/1.my_project/config/st

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sunowsir/Code/1.GitHub/1.my_project/config/st/build

# Include any dependencies generated for this target.
include CMakeFiles/st.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/st.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/st.dir/flags.make

CMakeFiles/st.dir/st.c.o: CMakeFiles/st.dir/flags.make
CMakeFiles/st.dir/st.c.o: ../st.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sunowsir/Code/1.GitHub/1.my_project/config/st/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/st.dir/st.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/st.dir/st.c.o -c /home/sunowsir/Code/1.GitHub/1.my_project/config/st/st.c

CMakeFiles/st.dir/st.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/st.dir/st.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sunowsir/Code/1.GitHub/1.my_project/config/st/st.c > CMakeFiles/st.dir/st.c.i

CMakeFiles/st.dir/st.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/st.dir/st.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sunowsir/Code/1.GitHub/1.my_project/config/st/st.c -o CMakeFiles/st.dir/st.c.s

CMakeFiles/st.dir/x.c.o: CMakeFiles/st.dir/flags.make
CMakeFiles/st.dir/x.c.o: ../x.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sunowsir/Code/1.GitHub/1.my_project/config/st/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/st.dir/x.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/st.dir/x.c.o -c /home/sunowsir/Code/1.GitHub/1.my_project/config/st/x.c

CMakeFiles/st.dir/x.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/st.dir/x.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sunowsir/Code/1.GitHub/1.my_project/config/st/x.c > CMakeFiles/st.dir/x.c.i

CMakeFiles/st.dir/x.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/st.dir/x.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sunowsir/Code/1.GitHub/1.my_project/config/st/x.c -o CMakeFiles/st.dir/x.c.s

CMakeFiles/st.dir/hb.c.o: CMakeFiles/st.dir/flags.make
CMakeFiles/st.dir/hb.c.o: ../hb.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sunowsir/Code/1.GitHub/1.my_project/config/st/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/st.dir/hb.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/st.dir/hb.c.o -c /home/sunowsir/Code/1.GitHub/1.my_project/config/st/hb.c

CMakeFiles/st.dir/hb.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/st.dir/hb.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sunowsir/Code/1.GitHub/1.my_project/config/st/hb.c > CMakeFiles/st.dir/hb.c.i

CMakeFiles/st.dir/hb.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/st.dir/hb.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sunowsir/Code/1.GitHub/1.my_project/config/st/hb.c -o CMakeFiles/st.dir/hb.c.s

# Object files for target st
st_OBJECTS = \
"CMakeFiles/st.dir/st.c.o" \
"CMakeFiles/st.dir/x.c.o" \
"CMakeFiles/st.dir/hb.c.o"

# External object files for target st
st_EXTERNAL_OBJECTS =

st: CMakeFiles/st.dir/st.c.o
st: CMakeFiles/st.dir/x.c.o
st: CMakeFiles/st.dir/hb.c.o
st: CMakeFiles/st.dir/build.make
st: CMakeFiles/st.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sunowsir/Code/1.GitHub/1.my_project/config/st/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable st"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/st.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/st.dir/build: st

.PHONY : CMakeFiles/st.dir/build

CMakeFiles/st.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/st.dir/cmake_clean.cmake
.PHONY : CMakeFiles/st.dir/clean

CMakeFiles/st.dir/depend:
	cd /home/sunowsir/Code/1.GitHub/1.my_project/config/st/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sunowsir/Code/1.GitHub/1.my_project/config/st /home/sunowsir/Code/1.GitHub/1.my_project/config/st /home/sunowsir/Code/1.GitHub/1.my_project/config/st/build /home/sunowsir/Code/1.GitHub/1.my_project/config/st/build /home/sunowsir/Code/1.GitHub/1.my_project/config/st/build/CMakeFiles/st.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/st.dir/depend


# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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
CMAKE_SOURCE_DIR = /home/valer/SSOO-2022-2023/shell_project

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/valer/SSOO-2022-2023/build

# Include any dependencies generated for this target.
include src/CMakeFiles/copyfile.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/CMakeFiles/copyfile.dir/compiler_depend.make

# Include the progress variables for this target.
include src/CMakeFiles/copyfile.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/copyfile.dir/flags.make

src/CMakeFiles/copyfile.dir/main.cc.o: src/CMakeFiles/copyfile.dir/flags.make
src/CMakeFiles/copyfile.dir/main.cc.o: /home/valer/SSOO-2022-2023/shell_project/src/main.cc
src/CMakeFiles/copyfile.dir/main.cc.o: src/CMakeFiles/copyfile.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/valer/SSOO-2022-2023/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/copyfile.dir/main.cc.o"
	cd /home/valer/SSOO-2022-2023/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/copyfile.dir/main.cc.o -MF CMakeFiles/copyfile.dir/main.cc.o.d -o CMakeFiles/copyfile.dir/main.cc.o -c /home/valer/SSOO-2022-2023/shell_project/src/main.cc

src/CMakeFiles/copyfile.dir/main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/copyfile.dir/main.cc.i"
	cd /home/valer/SSOO-2022-2023/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/valer/SSOO-2022-2023/shell_project/src/main.cc > CMakeFiles/copyfile.dir/main.cc.i

src/CMakeFiles/copyfile.dir/main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/copyfile.dir/main.cc.s"
	cd /home/valer/SSOO-2022-2023/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/valer/SSOO-2022-2023/shell_project/src/main.cc -o CMakeFiles/copyfile.dir/main.cc.s

src/CMakeFiles/copyfile.dir/copyfile.cc.o: src/CMakeFiles/copyfile.dir/flags.make
src/CMakeFiles/copyfile.dir/copyfile.cc.o: /home/valer/SSOO-2022-2023/shell_project/src/copyfile.cc
src/CMakeFiles/copyfile.dir/copyfile.cc.o: src/CMakeFiles/copyfile.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/valer/SSOO-2022-2023/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/CMakeFiles/copyfile.dir/copyfile.cc.o"
	cd /home/valer/SSOO-2022-2023/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/copyfile.dir/copyfile.cc.o -MF CMakeFiles/copyfile.dir/copyfile.cc.o.d -o CMakeFiles/copyfile.dir/copyfile.cc.o -c /home/valer/SSOO-2022-2023/shell_project/src/copyfile.cc

src/CMakeFiles/copyfile.dir/copyfile.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/copyfile.dir/copyfile.cc.i"
	cd /home/valer/SSOO-2022-2023/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/valer/SSOO-2022-2023/shell_project/src/copyfile.cc > CMakeFiles/copyfile.dir/copyfile.cc.i

src/CMakeFiles/copyfile.dir/copyfile.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/copyfile.dir/copyfile.cc.s"
	cd /home/valer/SSOO-2022-2023/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/valer/SSOO-2022-2023/shell_project/src/copyfile.cc -o CMakeFiles/copyfile.dir/copyfile.cc.s

src/CMakeFiles/copyfile.dir/usages.cc.o: src/CMakeFiles/copyfile.dir/flags.make
src/CMakeFiles/copyfile.dir/usages.cc.o: /home/valer/SSOO-2022-2023/shell_project/src/usages.cc
src/CMakeFiles/copyfile.dir/usages.cc.o: src/CMakeFiles/copyfile.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/valer/SSOO-2022-2023/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/CMakeFiles/copyfile.dir/usages.cc.o"
	cd /home/valer/SSOO-2022-2023/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/copyfile.dir/usages.cc.o -MF CMakeFiles/copyfile.dir/usages.cc.o.d -o CMakeFiles/copyfile.dir/usages.cc.o -c /home/valer/SSOO-2022-2023/shell_project/src/usages.cc

src/CMakeFiles/copyfile.dir/usages.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/copyfile.dir/usages.cc.i"
	cd /home/valer/SSOO-2022-2023/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/valer/SSOO-2022-2023/shell_project/src/usages.cc > CMakeFiles/copyfile.dir/usages.cc.i

src/CMakeFiles/copyfile.dir/usages.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/copyfile.dir/usages.cc.s"
	cd /home/valer/SSOO-2022-2023/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/valer/SSOO-2022-2023/shell_project/src/usages.cc -o CMakeFiles/copyfile.dir/usages.cc.s

# Object files for target copyfile
copyfile_OBJECTS = \
"CMakeFiles/copyfile.dir/main.cc.o" \
"CMakeFiles/copyfile.dir/copyfile.cc.o" \
"CMakeFiles/copyfile.dir/usages.cc.o"

# External object files for target copyfile
copyfile_EXTERNAL_OBJECTS =

bin/copyfile: src/CMakeFiles/copyfile.dir/main.cc.o
bin/copyfile: src/CMakeFiles/copyfile.dir/copyfile.cc.o
bin/copyfile: src/CMakeFiles/copyfile.dir/usages.cc.o
bin/copyfile: src/CMakeFiles/copyfile.dir/build.make
bin/copyfile: src/CMakeFiles/copyfile.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/valer/SSOO-2022-2023/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable ../bin/copyfile"
	cd /home/valer/SSOO-2022-2023/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/copyfile.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/copyfile.dir/build: bin/copyfile
.PHONY : src/CMakeFiles/copyfile.dir/build

src/CMakeFiles/copyfile.dir/clean:
	cd /home/valer/SSOO-2022-2023/build/src && $(CMAKE_COMMAND) -P CMakeFiles/copyfile.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/copyfile.dir/clean

src/CMakeFiles/copyfile.dir/depend:
	cd /home/valer/SSOO-2022-2023/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/valer/SSOO-2022-2023/shell_project /home/valer/SSOO-2022-2023/shell_project/src /home/valer/SSOO-2022-2023/build /home/valer/SSOO-2022-2023/build/src /home/valer/SSOO-2022-2023/build/src/CMakeFiles/copyfile.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/copyfile.dir/depend


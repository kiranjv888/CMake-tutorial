## CMake : Introduction  

CMake stands for cross-platform Make system. CMake is used to control the software compilation process using simple platform and compiler independent configuration files. CMake generates native makefiles and workspaces that can be used in the compiler environment of your choice.

**Author** : Andy Cedilnik, Bill Hoffman, Brad King, Ken Martin, Alexander Neundorf.

**Year** : 2000

The build system you would like to build can be passed to CMake as a parameter. However, CMake makes reasonable default choices depending on your system configuration.

## CMake Vs Make  

**Make** (or rather a Makefile) is a build system, it drives the compiler and other build tools to build your code.

**CMake** is a generator of build systems, it can produce Makefiles.<br>
So if you have a platform-independent project, CMake is a way to make it build system-independent as well.

    Here are advantages of CMake over Make:

     1. The language used to write CMakeLists.txt files is readable and easier to understand.<br>
     2. Cross-platform discovery of system libraries/functions/headers/flags.<br>
     3. Easier to compile your files into a shared library in a platform agnostic way, and in general easier to use than make.<br>
     4. CMake doesn’t only rely on "Make" to build the project, It supports multiple generators like Xcode, Eclipse, Visual Studio, etc.<br>

To make it simple, you can accomplish most of the features available in CMake by using Make but with an EXTRA EFFORT. 

## CMakeLists.txt & Compilation Process

CMake intended to be a cross-platform build process manager, so it defines it's own scripting language with certain sysntax and built-in features. CMake language is written in either **CMakeLists.txt** or file ends with file **<project_name>.cmake**.

    The compilation process in CMake performs two steps :
     1. Configuration
     2. Generation 

Both Configuration and Generation (build) commands are specified in one location and are handled entirely by CMake.

**Configuration** : In  this the script CMakeLists.txt is executed. This script is responsible for defining targets. Here target can be executable, library, or some other output of the build pipeline ( pipeline means the file that can help the compiler to search for the executables/libraries to link to this project which may be present in the system library, while you try to cross-compile things this will come into the picture).

If the configure step succeeds – meaning CMakeLists.txt completed without errors – CMake will generate a build pipeline using the targets defined by the script( CMakeLists.txt ). The type of build pipeline generated depends on the type of generator used.
CmakeCache.txt is created so that it can be helpful by reducing the time to build the pipeline in future.

**Generation** : This phase is meant to generate executable depending upon the targets created in the Configuration phase.<br>


The above-mentioned details can be visualized from the picture below.

[[File:Cmake-simple-flowchart.png]]

## File Hirearchy for CMake  

We will try to build **cmakeSampleProject** which tries to do addition and multiplication (user-defined functions).

[[File:Compare.jpeg]]


**Note :**<br>
1. The precence of **CmakeLists.txt** script file in every folder is must.<br>
2. **-->** : represent folders<br>
3. ** ->** : represent files<br>

## Commands to Configure and Build  

Now, let's see the steps to build and run an executable for **cmakeSampleProject**:

    $ cmake -H. -Bbuild 
Creates CMake configuration files inside folder build.

    $ cmake --build build -- -j3
Will generate the output file SampleProjectOutput  in the build folder.

    $ ./build/SampleProjectOutput
    Hello World
To run the executable.

## CMake Variables  

Here are some of CMake’s global variables, You should know

1. **CMAKE_BINARY_DIR** : If you are building in-source, this is the same as CMAKE_SOURCE_DIR, otherwise this is the top level directory of your build tree.

2. **CMAKE_SOURCE_DIR** : This is the directory, from which CMake was started, i.e. the top-level source directory.
    
3. **EXECUTABLE_OUTPUT_PATH** : Set this variable to specify a common place where CMake should put all executable files (instead of CMAKE_CURRENT_BINARY_DIR).<br>
  
       Ex: SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)

4. **LIBRARY_OUTPUT_PATH**: Set this variable to specify a common place where CMake should put all libraries (instead of CMAKE_CURRENT_BINARY_DIR).<br>

       Ex: SET(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)

5. **PROJECT_NAME** : the name of the project set by PROJECT() command.

6. **PROJECT_SOURCE_DIR** : contains the full path to the root of your project source directory, i.e. to the nearest directory where CMakeLists.txt contains the PROJECT() command.


## Cmake Commands  

These are some CMake commands mostly used,

1. **cmake_minimum_required ()** : This command make sure the minimum CMkae version required for the build process.<br>
An exception is raised if the command fails.<br>

       Ex : cmake_minimum_required (VERSION 2.6)

2. **project ()** : This command is used to give a name to the project you are working on.<br>

       Ex : project (Tutorial)

3. **add_executable ()**	: This is the place  you say the CMake to start the comilation process.<br> 
In the below example we say to compilation with the test.cpp.<br>

       Ex : add_executable(Tutorial tutorial.cpp)

4. **configure_file ()**	: Copies a file <input> to file <output> and substitutes variable values referenced in the file content.<br>
 syntax : configure_file(<input> <output>)<br>	
  
       Ex : configure_file ("${PROJECT_SOURCE_DIR}/TutorialConfig.h.in"  "${PROJECT_BINARY_DIR}/TutorialConfig.h")

5. **option ()**	: Provides an option that the user can optionally select.<br>
 syntax : option(<option_variable>  "help string describing option"     [initial value])<br>
 
       Ex : option (USE_MYMATH  "Use tutorial provided math implementation" ON)

6. **include_directories ()** : Loads and runs the CMake with the files that are requested to include.<br> 

       Ex : include_directories ("${PROJECT_SOURCE_DIR}/MathFunctions")

7. **add_subdirectory ()** : Adds the requested subdirectory to the build.<br>

       Ex : add_subdirectory (MathFunctions)

8. **set ()** : Used to set CMake/cache/environment variable to the given value.<br>

       Ex : set (Tutorial_VERSION_MAJOR 1)

9. **target_link_libraries ()** : Links the libraries to the Executable.<br> 

       Ex : target_link_libraries (Tutorial  ${EXTRA_LIBS})

10. **install ()** : specifies the rules to fallow during isntallation.can be executed externally with below command,<br>

        **$ make install**
	
        Ex :install (TARGETS Tutorial DESTINATION bin)
            install (FILES  "${PROJECT_BINARY_DIR}/TutorialConfig.h"  DESTINATION include)	
   In the above example, TARGETS is used for executables and for library files FILES is used.<br>

11. **check_function_exists ()**: This is used to check the system function existance, if present can set a macro.<br>

        Ex : check_function_exists (printf HAVE_PRINTF)

## CMake Options  
Here are some options used most commonly,

1. **--build <dir>** : Build a CMake-generated project binary tree.

2. **-i** : Run in wizard mode, Wizard mode runs cmake interactively without a GUI.  

3. **-D <var>:<type>=<value>** : <br> Create a cmake cache entry. When cmake is first run in an empty build tree, it creates a CMake cache.<br>
It is also used to overwrite the variable values during configuration step.
 
4. **-H** : Print usage information and exit.
     
5. **-B** : Points the build directory.

## Cross-Compilation with CMake   

The cross compilation requires an extra file, which instructions the CMake to overwrite the already defined CMake variables.<br>
Also, you have to change the Environment variables according to the path of <target toolchain directory>.

    Ex : $ cmake  -H. -Bcross_build -DCMAKE_CXX_FLAGS="-g -std=c++11 -Wall"  <br>
    -DCMAKE_TOOLCHAIN_FILE=./sample_cross_compile_toolchain_file.cmake   -DCMAKE_BUILD_TYPE=Debug

In above example, we are overwriting the defined "CMAKE_TOOLCHAIN_FILE" with "./sample_cross_compile_toolchain_file.cmake" using "-D" option.

## Practical Examples
Kindly follow below mentioned flow for practical learning, to avoid confusions
	1. basic_sample_project
	2. intermediate_sample_project
	3. advanced_sample_project
	4. auto_testing_sample_project
	5. cross_compilation_sample_project
			

## References

[https://cmake.org/cmake/help/v3.0/index.html For more CMake sysntax and built-in features]
[https://www.johnlamp.net/cmake-tutorial-4-libraries-and-subdirectories.html To know how to uild libraries using CMake]

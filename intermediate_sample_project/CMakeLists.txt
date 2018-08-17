cmake_minimum_required (VERSION 2.6)
project (Tutorial)

# The version number.
set (_Tutorial_VERSION_MAJOR_ 1)
set (_Tutorial_VERSION_MINOR_ 0)

# configure a header file to pass some of the CMake settings to the source code

# Here in this example CMake reads the above "set (_Tutorial_VERSION_MAJOR_ 1)"
# during the configuration step and  replaces the value of this with the macro in 
# "TutorialConfig.h.in" and creates "TutorialConfig.h" 

# Finally the macro "Tutorial_VERSION_MINOR" value in source code is read from 
# "TutorialConfig.h" and get replaced during the Generation step
configure_file (
  "${PROJECT_SOURCE_DIR}/TutorialConfig.h.in"
  "${PROJECT_BINARY_DIR}/TutorialConfig.h"
)

# we include the user defined "MathFunctions" library so that it gets loaded during the build
include_directories ("${PROJECT_SOURCE_DIR}/MathFunctions")
# Intimating the CMake about "MathFunctions" by using "add_subdirectory()"  command
add_subdirectory (MathFunctions)

# setting a variable for easy usage
set (EXTRA_LIBS ${EXTRA_LIBS} MathFunctions)

 
# add the binary tree to the search path for include files
# so that we will find TutorialConfig.h
include_directories("${PROJECT_BINARY_DIR}")


# add the executable
add_executable(Tutorial tutorial.cpp)
target_link_libraries (Tutorial  ${EXTRA_LIBS})




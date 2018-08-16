
# command make sures the minimum CMkae version required for the build process
cmake_minimum_required (VERSION 2.6)

# This command is used to give a name to the project you are working on
project (Tutorial)

# This is way you say the CMake to start the comilation process and create executable in the name of "Tutorial"
add_executable(Tutorial tutorial.cpp)

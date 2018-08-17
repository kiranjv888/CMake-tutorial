Intermediate CMake Tutorial
===========================

**Here in this tutorial, we will learn about,**
1. How to cross compile using CMake (i'm going to compile my code for OpenWRT in ubuntu)
    source path for openwrt : /home/sandeep/project/openwrt

**Prerequisites :**
1. We use the "-D" option for configuring the project with CMake, it will use overwrite the
    existed variable values with the values in the file given to it.

**Execution process :**
1. Set environment variable before Configuration step,
    The environment variables to set are in "envi_variables.sh" file.
2. Command to configure for the project,<br>
   
       $ cmake  -H. -Bcross_build-DCMAKE_CXX_FLAGS="-g -std=c++11 -Wall"   -DCMAKE_TOOLCHAIN_FILE=./sample_cross_compile_toolchain_file.cmake   -DCMAKE_BUILD_TYPE=Debug

Simple CMake Tutorial
=====================

This is a simple CMake tutorial, where we use predefined math library to get the square root for user given input.<br>

**Below are the steps to build and run an executable for basic_sample_project :**<br>

      $ cmake -H. -Bbuild
Creates CMake configuration files inside **build** folder.<br>
        
       $ cmake --build build -- -j3
Will generate the output file SampleProjectOutput in the **build** folder.<br>

       $ ./build/Tutorial 25
       The square root of 25 is 5
To run the executable.<br>

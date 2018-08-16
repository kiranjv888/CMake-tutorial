#Simple CMake Tutorial



This is a simple CMake tutorial, where we use predefined math library to get the square root for user given input.


**Below are the steps to build and run an executable for basic_sample_project :**

Creates CMake configuration files inside **build** folder.
        $ cmake -H. -Bbuild
        
Will generate the output file SampleProjectOutput in the **build** folder.
        $ cmake --build build -- -j3

To run the executable.
        $ ./build/Tutorial 25
        The square root of 25 is 5


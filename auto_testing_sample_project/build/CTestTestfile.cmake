# CMake generated Testfile for 
# Source directory: /home/jinka/git/CMake_tutorial/auto_testing_sample_project
# Build directory: /home/jinka/git/CMake_tutorial/auto_testing_sample_project/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
ADD_TEST(TutorialComp25 "Tutorial" "25")
SET_TESTS_PROPERTIES(TutorialComp25 PROPERTIES  PASS_REGULAR_EXPRESSION "25 is 5")
ADD_TEST(TutorialComp-25 "Tutorial" "-25")
SET_TESTS_PROPERTIES(TutorialComp-25 PROPERTIES  PASS_REGULAR_EXPRESSION "-25 is 0")
ADD_TEST(MANUAL_TEST "Tutorial" "100")
SET_TESTS_PROPERTIES(MANUAL_TEST PROPERTIES  PASS_REGULAR_EXPRESSION "100 is 10")
SUBDIRS(MathFunctions)

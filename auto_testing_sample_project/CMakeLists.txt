cmake_minimum_required (VERSION 2.6)
project (Tutorial)

set (_Tutorial_VERSION_MAJOR_ 1)
set (_Tutorial_VERSION_MINOR_ 0)

configure_file (
  "${PROJECT_SOURCE_DIR}/TutorialConfig.h.in"
  "${PROJECT_BINARY_DIR}/TutorialConfig.h"
)


option (USE_MYMATH  "Use tutorial provided math implementation" ON) 


if (USE_MYMATH)
  include_directories ("${PROJECT_SOURCE_DIR}/MathFunctions")
  add_subdirectory (MathFunctions)
  set (EXTRA_LIBS ${EXTRA_LIBS} MathFunctions)
endif (USE_MYMATH)

include_directories("${PROJECT_BINARY_DIR}")

add_executable(Tutorial tutorial.cpp)
target_link_libraries (Tutorial  ${EXTRA_LIBS})

install (TARGETS Tutorial DESTINATION bin)
install (FILES "${PROJECT_BINARY_DIR}/TutorialConfig.h"        
         DESTINATION include)


# Here the "check_function_exists()" command is used to verify if printf fucntion 
# defined in the system, if so the macro  "HAVE_PRINTF" will be set to value other thatn '0' (zero)
include (CheckFunctionExists)
check_function_exists (printf HAVE_PRINTF)


# The test cases can be deined as a macro, so that it will be easy for the user to give inputs
# test case is given name "CTest", and the macro name is "do_test"

include(CTest)
macro (do_test arg result)
  add_test (TutorialComp${arg} Tutorial ${arg})
  set_tests_properties (TutorialComp${arg}
    PROPERTIES PASS_REGULAR_EXPRESSION ${result})
endmacro (do_test)

# Here is the sample test case
do_test (25 "25 is 5")
do_test (-25 "-25 is 0")


# we can also write the test case directly with out using macro as ashown below

add_test (MANUAL_TEST Tutorial 100)
set_tests_properties (MANUAL_TEST  PROPERTIES PASS_REGULAR_EXPRESSION "100 is 10")

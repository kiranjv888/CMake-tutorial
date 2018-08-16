cmake_minimum_required (VERSION 2.6)
project (Tutorial)
# The version number.
set (_Tutorial_VERSION_MAJOR_ 1)
set (_Tutorial_VERSION_MINOR_ 0)

# configure a header file to pass some of the CMake settings
# to the source code
configure_file (
  "${PROJECT_SOURCE_DIR}/TutorialConfig.h.in"
  "${PROJECT_BINARY_DIR}/TutorialConfig.h"
)

# should we use our own math functions?

option (USE_MYMATH  "Use tutorial provided math implementation" ON) 


if (USE_MYMATH)
  include_directories ("${PROJECT_SOURCE_DIR}/MathFunctions")
  add_subdirectory (MathFunctions)
  set (EXTRA_LIBS ${EXTRA_LIBS} MathFunctions)
endif (USE_MYMATH)



include_directories("${PROJECT_BINARY_DIR}")


 
 
# add the binary tree to the search path for include files
# so that we will find TutorialConfig.h
 
# add the executable
add_executable(Tutorial tutorial.cpp)
target_link_libraries (Tutorial  ${EXTRA_LIBS})

install (TARGETS Tutorial DESTINATION bin)
install (FILES "${PROJECT_BINARY_DIR}/TutorialConfig.h"        
         DESTINATION include)



include (CheckFunctionExists)
check_function_exists (printf HAVE_)





include(CTest)


macro (do_test arg result)
  add_test (TutorialComp${arg} Tutorial ${arg})
  set_tests_properties (TutorialComp${arg}
    PROPERTIES PASS_REGULAR_EXPRESSION ${result})
endmacro (do_test)



#do_test (25 "25 is 5")
#do_test (-25 "-25 is 0")

cmake_minimum_required (VERSION 2.6)
project (Tutorial)
set (_Tutorial_VERSION_MAJOR_ 1)
set (_Tutorial_VERSION_MINOR_ 0)

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

add_executable(Tutorial tutorial.cpp)
target_link_libraries (Tutorial  ${EXTRA_LIBS})

# installing the executable and library files into the system files 

install (TARGETS Tutorial DESTINATION bin)
install (FILES "${PROJECT_BINARY_DIR}/TutorialConfig.h"        
         DESTINATION include)


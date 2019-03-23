project(.)

cmake_minimum_required(VERSION 3.13)

set (CMAKE_CXX_STANDARD 11)

file (GLOB SOURCES "*.cpp")
add_executable(tests ${SOURCES})

enable_testing()
find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})

target_link_libraries(tests ${GTEST_BOTH_LIBRARIES})

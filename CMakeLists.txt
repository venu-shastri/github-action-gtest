project(demo)

cmake_minimum_required(VERSION 3.13)

set (CMAKE_CXX_STANDARD 11)

file (GLOB SOURCES "demo/*.cpp")

add_executable(demo ${SOURCES})

enable_testing()
find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})

target_link_libraries(demo ${GTEST_BOTH_LIBRARIES})

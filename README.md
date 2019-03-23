GTest Action
============

GitHub action with built `gtest`.

## Usage

### Add test library to CMake

```cmake
set (CMAKE_CXX_STANDARD 11)

enable_testing()
find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})

target_link_libraries(${your_cmake_target} ${GTEST_BOTH_LIBRARIES})
```

### Workflow configuration

```
workflow "Unit Test" {
  on = "push"
  resolves = ["action-gtest"]
}

action "action-gtest" {
  uses = "CyberZHG/github-action-gtest@master"
  args = "-d demo -e tests"
}
```

Arguments:

* `-d`: The directory that contains `CMakeLists.txt`.
* `-e`: The name of target.

### Compile without CMake

Environment variables are defined:

* `GTEST_DIR`: Path to `googletest/googletest`.
* `GTEST_LIB_DIR`: Path to the built libraries.

### Run without the default script

```
workflow "Unit Test" {
  on = "push"
  resolves = ["action-gtest"]
}

action "action-gtest" {
  uses = "CyberZHG/github-action-gtest@master"
  runs = "your command"
}
```

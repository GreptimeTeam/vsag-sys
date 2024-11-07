cmake_minimum_required(VERSION 3.11)
project(vsag_wrapper)

set(CMAKE_CXX_STANDARD 11)

# download and build vsag
include(FetchContent)
FetchContent_Declare(
  vsag
  GIT_REPOSITORY https://github.com/alipay/vsag
  GIT_TAG v0.11.7
)
FetchContent_MakeAvailable(vsag)

add_library(vsag_wrapper STATIC src/wrapper.cpp)

target_include_directories(vsag_wrapper PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
    ${vsag_SOURCE_DIR}/include
)

# link with vsag
target_link_libraries(vsag_wrapper PUBLIC vsag)

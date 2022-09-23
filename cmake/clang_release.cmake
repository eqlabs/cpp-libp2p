set(CMAKE_BUILD_TYPE "Release")
set(CMAKE_CXX_COMPILER clang++ CACHE STRING "")
set(CMAKE_C_COMPILER clang CACHE STRING "")

include(${CMAKE_CURRENT_LIST_DIR}/toolchain/compiler/clang.cmake)
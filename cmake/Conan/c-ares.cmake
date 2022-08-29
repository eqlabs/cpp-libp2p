add_conan_package(c-ares 1.18.1)
find_package(c-ares MODULE REQUIRED)
include_directories(BEFORE SYSTEM  ${c-ares_INCLUDE_DIRS})

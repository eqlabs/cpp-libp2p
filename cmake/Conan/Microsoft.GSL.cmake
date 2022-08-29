add_conan_package(ms-gsl 2.0.0)
find_package(Microsoft.GSL MODULE REQUIRED)
include_directories(BEFORE SYSTEM ${Microsoft.GSL_INCLUDE_DIRS})

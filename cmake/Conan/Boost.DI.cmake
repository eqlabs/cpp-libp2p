add_conan_package(di 1.2.0 CONFIG_OPTIONS di:with_extensions=True)
find_package(di MODULE REQUIRED)
include_directories(BEFORE SYSTEM ${di_INCLUDE_DIRS})
set(BOOST_DI_TARGET di::di)

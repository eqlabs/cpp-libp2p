cmake_minimum_required(VERSION 3.14)

project(soralog)
include(ExternalProject)


message(STATUS "asdf: sqlite - cmakefiles.txt")
message(STATUS "CMAKE_CXX_COMPILER is ${CMAKE_CXX_COMPILER}")
message(STATUS "CMAKE_C_COMPILER is ${CMAKE_C_COMPILER}")
message(STATUS "CMAKE_TOOLCHAIN_FILE is ${CMAKE_TOOLCHAIN_FILE}")

set(INSTALL_DIR "${CMAKE_BINARY_DIR}/install")
ExternalProject_Add(SQLiteModernCpp
    GIT_REPOSITORY    "git@github.com:eqlabs/libp2p-sqlite-modern-cpp.git"
    GIT_TAG           "add-conan"
    GIT_SHALLOW       TRUE
    DOWNLOAD_DIR      "${CMAKE_BINARY_DIR}/download"
    SOURCE_DIR        "${CMAKE_BINARY_DIR}/src"
    BINARY_DIR        "${CMAKE_BINARY_DIR}/build"
    INSTALL_DIR       "${INSTALL_DIR}"
    LOG_DIR           "${CMAKE_BINARY_DIR}/log"
    LOG_INSTALL       TRUE
    LOG_CONFIGURE     TRUE
    CMAKE_ARGS        -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE} -DPACKAGE_MANAGER=Conan
)


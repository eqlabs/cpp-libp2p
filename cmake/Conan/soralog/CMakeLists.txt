cmake_minimum_required(VERSION 3.14)

project(soralog)
include(ExternalProject)

set(INSTALL_DIR "${CMAKE_BINARY_DIR}/install")
ExternalProject_Add(soralog
    GIT_REPOSITORY     "git@github.com:eqlabs/soralog.git"
    GIT_TAG            "73e03f01d2ae76d699685a297aca340f7637d1ab"
    GIT_SHALLOW        TRUE
    DOWNLOAD_DIR       "${CMAKE_BINARY_DIR}/download"
    SOURCE_DIR         "${CMAKE_BINARY_DIR}/src"
    BINARY_DIR         "${CMAKE_BINARY_DIR}/build"
    INSTALL_DIR        "${INSTALL_DIR}"
    CMAKE_ARGS         -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} -DPACKAGE_MANAGER=Conan)

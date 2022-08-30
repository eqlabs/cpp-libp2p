cmake_minimum_required(VERSION 3.14)

project(soralog)
include(ExternalProject)

set(INSTALL_DIR "${CMAKE_BINARY_DIR}/install")
ExternalProject_Add(soralog
    GIT_REPOSITORY     "git@github.com:eqlabs/soralog.git"
    GIT_TAG            "add-conan"
    GIT_SHALLOW        TRUE
    DOWNLOAD_DIR       "${CMAKE_BINARY_DIR}/download"
    SOURCE_DIR         "${CMAKE_BINARY_DIR}/src"
    BINARY_DIR         "${CMAKE_BINARY_DIR}/build"
    INSTALL_DIR        "${INSTALL_DIR}"
    CMAKE_ARGS         -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} -DPACKAGE_MANAGER=Conan)

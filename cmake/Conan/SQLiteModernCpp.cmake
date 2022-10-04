# TODO: we don't have Conan package for SQLiteModernCpp for now
# So we add it as an external project.
set(SQLiteModernCpp_ROOT "${CMAKE_BINARY_DIR}/SQLiteModernCpp")
file(MAKE_DIRECTORY "${SQLiteModernCpp_ROOT}")

set(SQLITE_GITHUB_HOST "github.com" CACHE STRING "Host for SQLiteModernCPP repo (maybe overriden to provide custom ssh key)")

# Configure external SQLiteModernCpp
execute_process(
    COMMAND ${CMAKE_COMMAND} ${SQLITE_ENV} "${CMAKE_CURRENT_LIST_DIR}/SQLiteModernCpp"
        -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
        -DGITHUB_HOST=${SQLITE_GITHUB_HOST}
    WORKING_DIRECTORY "${SQLiteModernCpp_ROOT}"
)

# Build external SQLiteModernCpp
execute_process(
    COMMAND ${CMAKE_COMMAND} --build "${SQLiteModernCpp_ROOT}"
)

set(SQLITE_MODERN_CPP_PACKAGE_PATH "${SQLiteModernCpp_ROOT}/install/lib/cmake/SQLiteModernCpp")
find_package(SQLiteModernCpp CONFIG REQUIRED PATHS "${SQLITE_MODERN_CPP_PACKAGE_PATH}")
include_directories(BEFORE SYSTEM "${SQLITE_MODERN_CPP_INSTALL_DIR}/include/")

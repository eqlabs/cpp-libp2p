# TODO: we don't have Conan package for SQLiteModernCpp for now
# So we add it as an external project.
set(SQLiteModernCpp_ROOT "${CMAKE_BINARY_DIR}/SQLiteModernCpp")
file(MAKE_DIRECTORY "${SQLiteModernCpp_ROOT}")

# Configure external SQLiteModernCpp
execute_process(
    COMMAND ${CMAKE_COMMAND} "${CMAKE_CURRENT_LIST_DIR}/SQLiteModernCpp"
    WORKING_DIRECTORY "${SQLiteModernCpp_ROOT}"
)

# Build external SQLiteModernCpp
execute_process(
    COMMAND ${CMAKE_COMMAND} --build "${SQLiteModernCpp_ROOT}"
)

find_package(SQLiteModernCpp CONFIG REQUIRED PATHS "${SQLiteModernCpp_ROOT}/install/lib/cmake/SQLiteModernCpp")
include_directories(BEFORE SYSTEM "${SQLITE_MODERN_CPP_INSTALL_DIR}/include/")

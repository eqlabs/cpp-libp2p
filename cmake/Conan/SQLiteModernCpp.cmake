# TODO: we don't have Conan package for SQLiteModernCpp for now
# So we add it as an external project.
set(SQLiteModernCpp_ROOT "${CMAKE_BINARY_DIR}/SQLiteModernCpp")
file(MAKE_DIRECTORY "${SQLiteModernCpp_ROOT}")

# Configure external soralog
execute_process(
    COMMAND ${CMAKE_COMMAND} "${CMAKE_CURRENT_LIST_DIR}/SQLiteModernCpp"
    WORKING_DIRECTORY "${SQLiteModernCpp_ROOT}"
)

# Build external soralog
execute_process(
    COMMAND ${CMAKE_COMMAND} --build "${SQLiteModernCpp_ROOT}"
)

# FIXME
set(SQLITE_MODERN_CPP_INSTALL_DIR "${SQLiteModernCpp_ROOT}/install")
include_directories(BEFORE SYSTEM "${SQLITE_MODERN_CPP_INSTALL_DIR}/include/")

set(SQLITE_MODERN_CPP_LIB_DIR "${SORALOG_INSTALL_DIR}/lib/")

add_library(SQLiteModernCpp::SQLiteModernCpp STATIC IMPORTED)
set_target_properties(SQLiteModernCpp::SQLiteModernCpp PROPERTIES
    IMPORTED_LOCATION "${SQLITE_MODERN_CPP_LIB_DIR}/SQLiteModernCpp.lib"
)

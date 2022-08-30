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

# Add sqlite3
add_conan_package(sqlite3 3.39.2)
find_package(SQLite3 MODULE REQUIRED)
include_directories(BEFORE SYSTEM ${SQLite3_INCLUDE_DIRS})

# Add include directories
set(SQLITE_MODERN_CPP_INSTALL_DIR "${SQLiteModernCpp_ROOT}/install")
include_directories(BEFORE SYSTEM "${SQLITE_MODERN_CPP_INSTALL_DIR}/include/")

add_library(SQLiteModernCpp INTERFACE)
add_library(SQLiteModernCpp::SQLiteModernCpp ALIAS SQLiteModernCpp)
target_link_libraries(SQLiteModernCpp INTERFACE SQLite::SQLite3)

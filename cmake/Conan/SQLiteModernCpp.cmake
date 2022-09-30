# TODO: we don't have Conan package for SQLiteModernCpp for now
# So we add it as an external project.
set(SQLiteModernCpp_ROOT "${CMAKE_BINARY_DIR}/SQLiteModernCpp")
file(MAKE_DIRECTORY "${SQLiteModernCpp_ROOT}")

# Configure external SQLiteModernCpp
execute_process(
    COMMAND ${CMAKE_COMMAND} "${CMAKE_CURRENT_LIST_DIR}/SQLiteModernCpp" -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE} -DCMAKE_CXX_FLAGS=${PROPAGATED_CXX_FLAGS} -DCMAKE_C_FLAGS=${PROPAGATED_C_FLAGS} -DCMAKE_EXE_LINKER_FLAGS=${PROPAGATED_EXE_LINKER_FLAGS} -DCMAKE_SHARED_LINKER_FLAGS=${PROPAGATED_SHARED_LINKER_FLAGS}
    WORKING_DIRECTORY "${SQLiteModernCpp_ROOT}"
)

# Build external SQLiteModernCpp
execute_process(
    COMMAND ${CMAKE_COMMAND} --build "${SQLiteModernCpp_ROOT}"
)

set(SQLITE_MODERN_CPP_PACKAGE_PATH "${SQLiteModernCpp_ROOT}/install/lib/cmake/SQLiteModernCpp")
find_package(SQLiteModernCpp CONFIG REQUIRED PATHS "${SQLITE_MODERN_CPP_PACKAGE_PATH}")
include_directories(BEFORE SYSTEM "${SQLITE_MODERN_CPP_INSTALL_DIR}/include/")

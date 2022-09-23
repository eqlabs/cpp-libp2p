# TODO: we don't have Conan package for soralog for now
# So we add it as an external project.
set(SORALOG_ROOT "${CMAKE_BINARY_DIR}/soralog")
file(MAKE_DIRECTORY "${SORALOG_ROOT}")

message(STATUS "asdf: soralog.cmake")
message(STATUS "CMAKE_CXX_COMPILER is ${CMAKE_CXX_COMPILER}")
message(STATUS "CMAKE_C_COMPILER is ${CMAKE_C_COMPILER}")
message(STATUS "CMAKE_TOOLCHAIN_FILE is ${CMAKE_TOOLCHAIN_FILE}")


# Configure external soralog
execute_process(
    COMMAND ${CMAKE_COMMAND} "${CMAKE_CURRENT_LIST_DIR}/soralog" -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE} -DPACKAGE_MANAGER=Conan
    WORKING_DIRECTORY "${SORALOG_ROOT}"
)

# Build external soralog
include(ProcessorCount)
ProcessorCount(CPU_COUNT)
execute_process(
    COMMAND ${CMAKE_COMMAND} --build "${SORALOG_ROOT}" --parallel ${CPU_COUNT}
)

set(SORALOG_PACKAGE_PATH "${SORALOG_ROOT}/install/lib/cmake/soralog")
find_package(soralog CONFIG REQUIRED PATHS "${SORALOG_PACKAGE_PATH}")
include_directories(BEFORE SYSTEM "${SORALOG_ROOT}/install/include")

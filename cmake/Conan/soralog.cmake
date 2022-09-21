# TODO: we don't have Conan package for soralog for now
# So we add it as an external project.
set(SORALOG_ROOT "${CMAKE_BINARY_DIR}/soralog")
file(MAKE_DIRECTORY "${SORALOG_ROOT}")

message(STATUS "---- sorlalog.cmake -----")
message(STATUS "PLC_PROFILE_PATH is ${PLC_PROFILE_PATH}")


# Configure external soralog
execute_process(
    COMMAND ${CMAKE_COMMAND} "${CMAKE_CURRENT_LIST_DIR}/soralog" -DPLC_PROFILE_PATH=${PLC_PROFILE_PATH}
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

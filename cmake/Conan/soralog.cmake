# TODO: we don't have Conan package for soralog for now
# So we add it as an external project.
set(SORALOG_ROOT "${CMAKE_BINARY_DIR}/soralog")
file(MAKE_DIRECTORY "${SORALOG_ROOT}")

if(SAN)
    set(PASSED_CXX_FLAGS ${CMAKE_CXX_FLAGS})
    set(PASSED_C_FLAGS ${CMAKE_C_FLAGS})
    set(PASSED_EXE_LINKER_FLAGS ${CMAKE_EXE_LINKER_FLAGS})
    set(PASSED_SHARED_LINKER_FLAGS ${CMAKE_SHARED_LINKER_FLAGS})
endif()

set(SORALOG_GITHUB_HOST "github.com" CACHE STRING "Host for soralog repo (maybe overriden to provide custom ssh key)")

# Configure external soralog
execute_process(
    COMMAND ${CMAKE_COMMAND} "${CMAKE_CURRENT_LIST_DIR}/soralog" -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE} -DCMAKE_CXX_FLAGS=${PASSED_CXX_FLAGS} -DCMAKE_C_FLAGS=${PASSED_C_FLAGS} -DCMAKE_EXE_LINKER_FLAGS=${PASSED_EXE_LINKER_FLAGS} -DCMAKE_SHARED_LINKER_FLAGS=${PASSED_SHARED_LINKER_FLAGS} -DGITHUB_HOST=${SORALOG_GITHUB_HOST}
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

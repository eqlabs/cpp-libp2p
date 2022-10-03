# TODO: we don't have Conan package for soralog for now
# So we add it as an external project.
set(SORALOG_ROOT "${CMAKE_BINARY_DIR}/soralog")
file(MAKE_DIRECTORY "${SORALOG_ROOT}")

if($ENV{SORALOG_SSH_KEY_PATH})
    set(SORALOG_ENV "-E env GIT_SSH_COMMAND=\"ssh -i $ENV{SORALOG_SSH_KEY_PATH}\"")
endif()
#set (SORALOG_ENV "GIT_SSH_COMMAND=\"ssh -i /home/dgordon/.ssh\"")

# Configure external soralog
execute_process(
    COMMAND ${CMAKE_COMMAND} ${SORALOG_SSH_KEY_PATH} "${CMAKE_CURRENT_LIST_DIR}/soralog" -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
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

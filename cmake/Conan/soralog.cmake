# TODO: we don't have Conan package for soralog for now
# So we add it as an external project.
set(SORALOG_ROOT "${CMAKE_BINARY_DIR}/soralog")
file(MAKE_DIRECTORY "${SORALOG_ROOT}")

# Configure external soralog
execute_process(
    COMMAND ${CMAKE_COMMAND} "${CMAKE_CURRENT_LIST_DIR}/soralog"
    WORKING_DIRECTORY "${SORALOG_ROOT}"
)

# Build external soralog
execute_process(
    COMMAND ${CMAKE_COMMAND} --build "${SORALOG_ROOT}"
)

# FIXME
set(SORALOG_INSTALL_DIR "${SORALOG_ROOT}/install")
include_directories(BEFORE SYSTEM "${SORALOG_INSTALL_DIR}/include")

set(SORALOG_LIB_DIR "${SORALOG_INSTALL_DIR}/lib/soralog/")
add_library(soralog::soralog STATIC IMPORTED)
set_target_properties(soralog::soralog PROPERTIES
    IMPORTED_LOCATION "${SORALOG_LIB_DIR}/soralog.lib"
)
add_dependencies(soralog::soralog soralog)

add_library(soralog::fallback_configurator STATIC IMPORTED)
set_target_properties(soralog::fallback_configurator PROPERTIES
    IMPORTED_LOCATION "${SORALOG_LIB_DIR}/fallback_configurator.lib"
)
add_dependencies(soralog::fallback_configurator soralog)

add_library(soralog::configurator_yaml STATIC IMPORTED)
set_target_properties(soralog::configurator_yaml PROPERTIES
    IMPORTED_LOCATION "${SORALOG_LIB_DIR}/configurator_yaml.lib"
)
add_dependencies(soralog::configurator_yaml soralog)

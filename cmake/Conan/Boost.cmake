add_conan_package(boost 1.80.0
    CONFIG_OPTIONS
    boost:without_atomic=False
    boost:without_chrono=False
    boost:without_container=False
    boost:without_context=True
    boost:without_contract=True
    boost:without_coroutine=True
    boost:without_date_time=True
    boost:without_exception=False
    boost:without_fiber=True
    boost:without_filesystem=False
    boost:without_graph=True
    boost:without_graph_parallel=True
    boost:without_iostreams=True
    boost:without_locale=True
    boost:without_log=True
    boost:without_math=False
    boost:without_mpi=True
    boost:without_program_options=False
    boost:without_python=True
    boost:without_random=False
    boost:without_regex=True
    boost:without_serialization=True
    boost:without_stacktrace=True
    boost:without_system=False
    boost:without_test=True
    boost:without_thread=True
    boost:without_timer=True
    boost:without_type_erasure=True
    boost:without_wave=True)
find_package(Boost MODULE REQUIRED random filesystem program_options)
include_directories(BEFORE SYSTEM ${Boost_INCLUDE_DIRS})

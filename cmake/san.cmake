include(${CMAKE_CURRENT_LIST_DIR}/utils.cmake)

if(SAN OR ASAN OR LSAN OR MSAN OR TSAN OR UBSAN)
  if (DEFINED POLLY_FLAGS_SANITIZE_ADDRESS_CMAKE_)
    return()
  else ()
    set(POLLY_FLAGS_SANITIZE_ADDRESS_CMAKE_ 1)
  endif ()

  if(SAN STREQUAL "ASAN" OR ASAN)
    print("Address Sanitizer is enabled")
    include(${CMAKE_CURRENT_LIST_DIR}/toolchain/flags/sanitize_address.cmake)
  elseif(SAN STREQUAL "LSAN" OR LSAN)
    print("Leak Sanitizer is enabled")
    include(${CMAKE_CURRENT_LIST_DIR}/toolchain/flags/sanitize_leak.cmake)
  elseif(SAN STREQUAL "MSAN" OR MSAN)
    print("Memory Sanitizer is enabled")
    include(${CMAKE_CURRENT_LIST_DIR}/toolchain/flags/sanitize_memory.cmake)
  elseif(SAN STREQUAL "TSAN" OR TSAN)
    print("Thread Sanitizer is enabled")
    include(${CMAKE_CURRENT_LIST_DIR}/toolchain/flags/sanitize_thread.cmake)
  elseif(SAN STREQUAL "UBSAN" OR UBSAN)
    print("Undefined Behavior Sanitizer is enabled")
    include(${CMAKE_CURRENT_LIST_DIR}/toolchain/flags/sanitize_undefined.cmake)
  endif()
  process_sanitizer_flags()  
endif()

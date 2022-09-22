function(set_profile_path)
  if (NOT PLC_PROFILE)
    set(PLC_PROFILE "clang_debug")
  endif()
  set(profiles clang_release clang_debug gcc_release gcc_debug)
  list(FIND profiles ${PLC_PROFILE} index)
  if(index EQUAL -1)
    message(FATAL_ERROR "PLC_PROFILE must be one of clang_release|clang_debug|gcc_release|gcc_debug")
  endif()
  set(PLC_PROFILE_PATH "${CMAKE_SOURCE_DIR}/cmake/${PLC_PROFILE}_profile.cmake" PARENT_SCOPE)
endfunction()
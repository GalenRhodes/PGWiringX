
file(GLOB_RECURSE libPGWiringX_SRC_C RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "*.c")
file(GLOB_RECURSE libPGWiringX_SRC_M RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "*.m")
file(GLOB_RECURSE libPGWiringX_HEADR RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "*.h")
file(GLOB_RECURSE libPGWiringX_PRIVT RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "Private/*.h")

set(libPGWiringX_INC "")
foreach(afile ${libPGWiringX_HEADR})
	get_filename_component(dirname "${afile}" PATH)
	if(dirname STREQUAL "")
		list(APPEND libPGWiringX_INC ".")
	else()
		list(APPEND libPGWiringX_INC "${dirname}")
	endif()
endforeach(afile)
list(REMOVE_DUPLICATES libPGWiringX_INC)
include_directories(${libPGWiringX_INC})

list(REMOVE_ITEM libPGWiringX_HEADR ${libPGWiringX_PRIVT})

set_source_files_properties(${libPGWiringX_SRC_C} PROPERTIES LANGUAGE C COMPILE_FLAGS "-fblocks -std=gnu99")
set_source_files_properties(${libPGWiringX_SRC_M} PROPERTIES LANGUAGE C COMPILE_FLAGS "${objc_flags}")
set_source_files_properties(${libPGWiringX_HEADR} PROPERTIES LANGUAGE C COMPILE_FLAGS HEADER_FILE_ONLY YES)
set_source_files_properties(${libPGWiringX_PRIVT} PROPERTIES LANGUAGE C COMPILE_FLAGS HEADER_FILE_ONLY YES)

set(ALL_SRC_FILES ${libPGWiringX_SRC_C} ${libPGWiringX_SRC_M} ${libPGWiringX_HEADR} ${libPGWiringX_PRIVT})

add_library(libPGWiringX_SHARED SHARED ${ALL_SRC_FILES})
target_link_libraries(libPGWiringX_SHARED)
set_target_properties(libPGWiringX_SHARED PROPERTIES LINKER_LANGUAGE C LINK_FLAGS "${objc_link_flags}" SOVERSION "${PGWiringX_VERSION}" VERSION "${PGWiringX_VERSION}" OUTPUT_NAME "${CMAKE_PROJECT_NAME}")

install(TARGETS libPGWiringX_SHARED libPGWiringX_STATIC ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
install(FILES ${libPGWiringX_HEADR} DESTINATION "include/${CMAKE_PROJECT_NAME}")

set(XLNT_ROOT_DIR "$ENV{XLNT_ROOT_DIR}" CACHE PATH "XLNT root directory.")
message("Looking for XLNT in ${XLNT_ROOT_DIR}")


find_path(XLNT_INCLUDE_DIR
	NAMES xlnt.hpp
	HINTS /usr/local/include
	HINTS ext_lib/xlnt-1.3.0/include/xlnt
	HINTS ext_lib/xlnt-1.3.0/build/include/xlnt
	HINTS ${XLNT_ROOT_DIR}/include
)

if(APPLE)
find_library(XLNT_LIBRARY
	libxlnt.dylib
	HINTS /usr/local/lib
	HINTS ext_lib/xlnt-1.3.0/source
	HINTS ext_lib/xlnt-1.3.0/build/source
	HINTS ${XLNT_ROOT_DIR}/source
)
elseif(UNIX)
find_library(XLNT_LIBRARY
	libxlnt.so
	HINTS /usr/local/lib
	HINTS ext_lib/xlnt-1.3.0/source
	HINTS ext_lib/xlnt-1.3.0/build/source
	HINTS ext_lib/xlnt-1.3.0/build/lib
	HINTS ${XLNT_ROOT_DIR}/source
)
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(XLNT DEFAULT_MSG XLNT_LIBRARY XLNT_INCLUDE_DIR)

if(XLNT_FOUND)
	message("—- Found XLNT under ${XLNT_INCLUDE_DIR}")
    set(XLNT_INCLUDE_DIRS ${XLNT_INCLUDE_DIR})
    set(XLNT_LIBRARIES ${XLNT_LIBRARY})
    if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
        set(XLNT_LIBRARIES "${XLNT_LIBRARIES};m;pthread")
    endif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
endif(XLNT_FOUND)

mark_as_advanced(XLNT_LIBRARY XLNT_INCLUDE_DIR)

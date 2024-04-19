# project(third_party_libraries)
# add_executable(${PROJECT_NAME} hello.cpp hello.hpp)
cmake_minimum_required(VERSION 3.19 FATAL_ERROR)

set(lib_name "third_party_libraries")

set(FULLPATH "${CMAKE_SOURCE_DIR}/third_party_libraries")

# add cpp, hpp,h files
file(GLOB BaseFiles "${FULLPATH}/*.cpp" "${FULLPATH}/*.hpp" "${FULLPATH}/*.h")
add_library(${lib_name}
    ${BaseFiles}
)

include_directories("${FULLPATH}")
set(INCLUDPATH "${FULLPATH}/include")
set(LIBRARYPATH "${FULLPATH}/library")

if(EXISTS "${LIBRARYPATH}")
    message(STATUS "Folder exists: ${LIBRARYPATH}")
else()
    message(FATAL_ERROR "Folder does not exist: ${LIBRARYPATH}")
endif()

file(GLOB Files "${LIBRARYPATH}/*")

# target_link_libraries(${PROJECT_NAME} ${FULLPATH}/library/sfml-audio-d.lib)
# include("${CMAKE_SOURCE_DIR}/third_party_libraries/include")
# Count the number of files
list(LENGTH Files NUM_FILES)
message(STATUS "Count of Founded files: ${NUM_FILES}")

message(STATUS "Including (${INCLUDPATH})")

# start SFML
include("./../cmake/sfml_find.cmake")

# end SFML

# link library
target_include_directories(${lib_name} PUBLIC ${FULLPATH})
target_link_libraries(${lib_name}
    PUBLIC $<BUILD_INTERFACE:developer_flags>
    sfml-graphics
)

include_directories(${INCLUDPATH})

foreach(FILE ${Files})
    # Do something with each file, for example, print its name
    message(STATUS "Found file: ${FILE}")

    # target_link_libraries(${PROJECT_NAME} ${FILE})
endforeach()

# set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD)

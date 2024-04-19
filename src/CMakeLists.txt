set(exec_name "SFML_Tutorial")

project("${exec_name}" VERSION 3.9)
message(STATUS "----------------------${PROJECT_NAME}")

set(FULLPATH "${CMAKE_SOURCE_DIR}/third_party_libraries")
message(STATUS "----te232322----${FULLPATH}")
file(GLOB_RECURSE src_files ${FULLPATH}/*.cpp ${FULLPATH}/*.hpp ${FULLPATH}/*.h) # <TODO> change this to add your files
add_executable(${exec_name} ${src_files})

# Libs linked to the executable
target_link_libraries(${exec_name}
    third_party_libraries
    $<BUILD_INTERFACE:developer_flags>
)
message(STATUS "third_party_libraries linked")
message(STATUS "Starting find SFML library")

include(FetchContent)
FETCHCONTENT_DECLARE(SFML GIT_REPOSITORY "https://github.com/SFML/SFML.git" GIT_TAG 2.6.1)
FETCHCONTENT_MAKEAVAILABLE(SFML)

message(STATUS "Finished find SFML library")

# target_link_libraries(${PROJECT_NAME} sfml-graphics)
cmake_policy(SET CMP0048 NEW)
project(update-contour-ids LANGUAGES C CXX)
cmake_minimum_required(VERSION 3.16)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON) # build should fail when compiler don't support standard defined by CMAKE_CXX_STANDARD
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_VERBOSE_MAKEFILE OFF)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -pedantic -Wno-unused-function")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-omit-frame-pointer -fstack-protector-all -fPIC")

find_package(LibXml2)

add_definitions(${LIBXML2_DEFINITIONS})

add_executable(update-contour-ids update-contour-ids.cpp)
target_link_libraries(update-contour-ids ${LIBXML2_LIBRARIES})
target_include_directories(update-contour-ids PRIVATE ${LIBXML2_INCLUDE_DIR})

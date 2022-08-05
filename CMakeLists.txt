cmake_minimum_required(VERSION 3.20)

if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
  message(STATUS "This project is a top-level one")
else()
  message(STATUS "This project has a top-level one called [${CMAKE_PROJECT_NAME}]")
  set(PROJECT_NAME "app")
  set(PROJECT_VERSION "0.1.0")
  set(CMAKE_PREFIX_PATH "./")
endif()

project(${PROJECT_NAME} VERSION ${PROJECT_VERSION})
file(GLOB_RECURSE fCApp ${PROJECT_SOURCE_DIR}/src/*.cpp)
add_executable(${PROJECT_NAME} ${fCApp})

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

# spdlog
find_package(spdlog CONFIG REQUIRED)
target_link_libraries(${PROJECT_NAME} PRIVATE spdlog::spdlog spdlog::spdlog_header_only)
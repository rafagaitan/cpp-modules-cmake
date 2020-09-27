cmake_minimum_required(VERSION 3.16)
project(cpp-modules)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(PREBUILT_MODULE_PATH ${CMAKE_BINARY_DIR}/modules)

add_compile_options(-fmodules)
add_compile_options(-stdlib=libc++)
add_compile_options(-fbuiltin-module-map)
add_compile_options(-fimplicit-module-maps)

set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMakeModules;${CMAKE_MODULE_PATH}")
include(functions)

add_subdirectory(lib1)
add_subdirectory(app)

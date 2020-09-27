cmake_minimum_required(VERSION 3.16)
project(app VERSION 0.0.1 LANGUAGES CXX)

set(target_name main)
set(source_files main.cpp)

add_executable(${target_name} ${source_files})
target_link_modules_library(${target_name} lib1)

install(TARGETS ${target_name}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
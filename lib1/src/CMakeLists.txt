cmake_minimum_required(VERSION 3.16)
project(lib1 VERSION 0.0.1 LANGUAGES CXX)

set(target_name lib1)
set(source_files 
    Logger.cpp
)

add_library_module(${target_name} STATIC ${source_files})

target_include_directories(${target_name}
    PUBLIC 
        $<INSTALL_INTERFACE:include>    
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
)

# Required to make it work with libc++ (in ubuntu install libc++-10 and libc++abi-10)
target_link_libraries(${target_name} PUBLIC -lc++)

include(GNUInstallDirs)
set(INSTALL_CONFIGDIR ${CMAKE_INSTALL_LIBDIR}/cmake/${target_name})

install(TARGETS ${target_name}
    EXPORT ${target_name}-targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

install(DIRECTORY ${PREBUILT_MODULE_PATH}/${target_name}/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${target_name})

#Export the targets to a script
install(EXPORT ${target_name}-targets
    FILE
        lib1Targets.cmake
    NAMESPACE
        cpp-modules::
    DESTINATION
        ${INSTALL_CONFIGDIR}
)

export(EXPORT ${target_name}-targets
    FILE ${CMAKE_CURRENT_BINARY_DIR}/lib1Targets.cmake
    NAMESPACE cpp-modules::)

#Register package in user's package registry
export(PACKAGE ${target_name})

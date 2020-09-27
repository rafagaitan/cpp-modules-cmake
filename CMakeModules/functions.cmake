# Based on this response from stackoverflow: https://stackoverflow.com/questions/57300495/how-to-use-c20-modules-with-cmake/62499857#62499857
function(add_module target_name source_file)
    # TODO: Add support for gcc and cl.exe
    get_filename_component(source_name ${source_file} NAME_WE)
    add_custom_target(${source_name}.pcm
            COMMAND
                ${CMAKE_CXX_COMPILER}
                -std=c++2a
                -stdlib=libc++
                -fmodules
                -c
                ${CMAKE_CURRENT_SOURCE_DIR}/${source_file}
                -Xclang -emit-module-interface
                -o ${PREBUILT_MODULE_PATH}/${target_name}/${source_name}.pcm
            )
    add_dependencies(${target_name} ${source_name}.pcm)
endfunction()

function(add_library_module target_name type source_files)
file(MAKE_DIRECTORY ${PREBUILT_MODULE_PATH}/${target_name})
    add_library(${target_name} ${type} ${source_files})
    foreach(source_file ${source_files})
        add_module(${target_name} ${source_file})
    endforeach()
endfunction()

function(target_link_modules_library target_name modules_library)
    target_link_libraries(${target_name} ${modules_library})
    # Add specific module path of lib1 (ugh!)
    target_compile_options(${target_name} PRIVATE
        $<$<OR:$<CXX_COMPILER_ID:Clang>,$<CXX_COMPILER_ID:AppleClang>,$<CXX_COMPILER_ID:GNU>>:
        -fprebuilt-module-path=${PREBUILT_MODULE_PATH}/${modules_library}>)
endfunction()
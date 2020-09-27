# C++20 modules and CMake

Simple example using CMake to build a library with the C++20 modules.

## Build instructions

```sh
$ mkdir build && cd build
$ cmake ..
$ make
```

The example also provides install targets:

```sh
$ mkdir build && cd build
$ cmake .. -DCMAKE_INSTALL_PREFIX=<path>/cpp-modules-sdk
$ make install
```



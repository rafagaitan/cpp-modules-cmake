# C++20 modules and CMake

Simple example using CMake to build a library with the C++20 modules.

## Requirements

Current version requires clang compiler with c++20 support. Tested with clang-10 on Ubuntu 20.04.

To make it work in my system, I had to specifically link to libc++ and install the following packages:
```sh
sudo apt install libc++-10-dev libc++abi-10-dev
```

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

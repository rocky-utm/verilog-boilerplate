cmake_minimum_required(VERSION 3.12)
cmake_policy(SET CMP0074 NEW)
project(verilator_demo)

set(CMAKE_CXX_STANDARD 17)

find_package(verilator)
if (NOT verilator_FOUND)
    message(FATAL_ERROR "Verilator was not found. Either install it, or set the VERILATOR_ROOT environment variable")
endif()

add_executable(NAME_test testbench.cpp)

verilate(NAME_test
        INCLUDE_DIRS .
        SOURCES NAME.v testbench.v
        VERILATOR_ARGS --timing --trace)

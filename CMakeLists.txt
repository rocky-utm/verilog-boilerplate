cmake_minimum_required(VERSION 3.12)
cmake_policy(SET CMP0074 NEW)
project(verilator_demo)

set(CMAKE_CXX_STANDARD 17)

find_package(verilator HINTS /opt/homebrew/Cellar/verilator/5.006/share/verilator/)
if (NOT verilator_FOUND)
    message(FATAL_ERROR "Verilator was not found. Either install it, or set the VERILATOR_ROOT environment variable")
endif()

add_executable(verilator_demo ledmodule.cpp)

verilate(verilator_demo
        INCLUDE_DIRS .
        SOURCES ledmodule.v)

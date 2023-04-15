## Verilog + verilator + Gtkwave boilerplate generator

This is a simple script to generate a boilerplate for a verilog project using verilator and gtkwave.

### Requirements
- gcc
- g++
- make
- cmake
- [verilator](https://www.veripool.org/verilator/)
- [gtkwave](https://gtkwave.sourceforge.net/)

### Usage

```bash
$ vinit -name <project-name>
$ cd <project-name>
$ make cmake
# make changes to <project-name>.v and testbench.v
$ make
```

### Running the project

```bash
$ make test
```

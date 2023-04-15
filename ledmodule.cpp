#include <cstdlib>
#include <iostream>
#include "verilated.h"
#include "verilated_vcd_c.h"
#include "obj_dir/Vledmodule.h"

#define MAX_TIME 20
vluint16_t sim_time = 0;

int main(int argc, char** argv, char** env) {
    auto *dut = new Vledmodule;
    Verilated::traceEverOn(true);
    auto *m_trace = new VerilatedVcdC;
    dut->trace(m_trace, 5);
    m_trace->open("waveform.vcd");

    while (sim_time < MAX_TIME) {
        dut->clk ^= 1;
        dut->rst = 0;
        dut->eval();
        m_trace->dump(sim_time++);
    }

    m_trace->close();
    exit(EXIT_SUCCESS);
}

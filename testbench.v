module ledmodule_tb();
reg t_clk, t_rst;
wire led;

ledmodule ledmodule_inst(
    .led(led),
    .clk(t_clk),
    .rst(t_rst)
);

initial begin
    t_clk = 0; t_rst = 0;
    #5 t_clk = 1; t_rst = 0;
    #5 t_clk = 0; t_rst = 0;
    #5 t_clk = 1; t_rst = 0;
    #5 t_clk = 0; t_rst = 0;
    #5 t_clk = 1; t_rst = 0;
    #5 t_clk = 0; t_rst = 0;
    #5 t_clk = 1; t_rst = 0;
    #5 t_clk = 0; t_rst = 0;
    #5 t_clk = 1; t_rst = 0;
    #5 t_clk = 0; t_rst = 0;
    #5 t_clk = 1; t_rst = 0;
    #5 t_clk = 0; t_rst = 0;
    #5 t_clk = 1; t_rst = 0;
end
endmodule

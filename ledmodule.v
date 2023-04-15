module ledmodule(led, clk, rst);
output reg led;
input clk, rst;

reg [2:0] counter = 3'd0;

always @(posedge clk) begin
    counter <= (counter + 1'd1);

    if (counter >= 3'd2) begin
        led <= 1'd1;
    end else begin
        led <= 1'd0;
    end

    if (rst) begin
        counter <= 3'd0;
        led <= 1'd0;
    end
end

endmodule

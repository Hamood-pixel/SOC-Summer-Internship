`timescale 1ns/1ps 

module part2_tb;

reg clock_50, reset_n;
wire [6:0] HEX2, HEX1, HEX0;

part2 dut (
    .clock_50(clock_50),
    .reset_n(reset_n),
    .HEX2(HEX2),
    .HEX1(HEX1),
    .HEX0(HEX0)
);

initial begin
    clock_50 = 0;
    forever #10 clock_50 = ~clock_50;
end

initial begin
    reset_n = 0;
    #50;
    reset_n = 1;
    #200000;
    $stop;
end

endmodule

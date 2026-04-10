`timescale 1ns/1ps

module part4_tb;

reg clk;
reg reset_n;
reg start;
reg [2:0] letter;
wire LEDR0;

morse_code dut (
    .clk(clk),
    .reset_n(reset_n),
    .start(start),
    .letter(letter),
    .LEDR0(LEDR0)
);

initial begin
    clk = 0;
    forever #10 clk = ~clk; 
end

initial begin
    reset_n = 0;
    start = 0;
    letter = 3'b000;
    #50;
    reset_n = 1;
    #50;

    letter = 3'b000; // A
    start = 1;
    #20;
    start = 0;

    #500_000_000;

    letter = 3'b001; // B
    start = 1;
    #20;
    start = 0;

    #1_000_000_000;

    $stop;
end

endmodule

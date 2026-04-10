`timescale 1ns/1ps

module part3_tb;

reg clock_50, reset_n, key0, key1;
reg [7:0] sw;
wire [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;

clock dut (
    .clock_50(clock_50),
    .reset_n(reset_n),
    .key0(key0),
    .key1(key1),
    .sw(sw),
    .HEX5(HEX5),
    .HEX4(HEX4),
    .HEX3(HEX3),
    .HEX2(HEX2),
    .HEX1(HEX1),
    .HEX0(HEX0)
);

initial begin
    clock_50 = 0;
    forever #10 clock_50 = ~clock_50;
end

initial begin
    reset_n = 0; key0 = 1; key1 = 1; sw = 8'd0;
    #40 reset_n = 1;
    #100 key0 = 0; #40 key0 = 1;
    #200 sw = 8'd57; key1 = 0; #40 key1 = 1;
    #5000 $stop;
end

endmodule

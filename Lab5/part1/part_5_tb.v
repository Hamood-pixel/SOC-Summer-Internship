`timescale 1ns/1ps

module part_5_tb;

reg reset,clock_50;
wire [6:0] hex5, hex4, hex3, hex2, hex1, hex0;

part_5 dut (.reset(reset), .clock_50(clock_50), .hex5(hex5), .hex4(hex4), .hex3(hex3), .hex2(hex2), .hex1(hex1), .hex0(hex0));

initial begin 
clock_50 = 0;
forever #10 clock_50 = ~clock_50;
end 

initial begin 

reset = 1; 

#20; 
reset = 0; //flushed out part 

#20; 

#100; //after 100ns one enable high
#1000; 
$stop;
end 
endmodule    
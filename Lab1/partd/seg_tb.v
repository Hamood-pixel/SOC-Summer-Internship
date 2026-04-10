`timescale 1ns/1ps 

module seg_tb;

reg c1;
reg c0;
wire [0:6] HEX0;

seg dut (.c1(c1), .c0(c0), .HEX0(HEX0));

initial begin
 c1 = 0; c0 = 0; #10;
 c1 = 0; c0= 1; #10;
 c1 = 1; c0 = 0; #10;
 c1 = 1; c0 = 1; #10;
 $stop;
 end 
endmodule 
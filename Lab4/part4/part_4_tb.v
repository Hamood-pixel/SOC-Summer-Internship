`timescale 1ns/1ps 

module part_4_tb;

reg clock_50, reset; 
wire [6:0] hex3,hex2,hex1,hex0; 

part_4 dut (.clock_50(clock_50), .reset(reset), .hex3(hex3), .hex2(hex2), .hex1(hex1), .hex0(hex0));

initial begin
clock_50 =0; 
forever #10 clock_50 = ~clock_50; //20ns period 
end 

initial begin 
reset = 1;  

#20; 

reset = 0; 

#20; 

#200;  //check output 

#400; 

$stop; 
end 
endmodule 
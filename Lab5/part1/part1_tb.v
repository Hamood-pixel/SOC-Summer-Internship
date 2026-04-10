`timescale 1ns/1ps 

module part1_tb; 

localparam n =5;
localparam k =20;

reg clock, reset_n;
wire LEDR0;
wire [n-1:0] LEDR; 

part1 # (.n(n), .k(k)) dut (.clock(clock), .reset_n(reset_n), .LEDR0(LEDR0), .LEDR(LEDR));

initial begin 
clock =0; 
forever #10 clock = ~clock;
end 

initial begin 
reset_n =0; 
#20;
reset_n = 1; //release reset signal 
#10; 

#2000; 

#10000;

$stop;
end 
endmodule 
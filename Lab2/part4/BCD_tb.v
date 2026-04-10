`timescale 1ns/1ps 

module BCD_tb;

reg [3:0] A,B;
reg CIN;
wire tens;
wire [3:0] ones;
wire [6:0] Hex0, Hex1;

BCD dut (.A(A), .B(B), .CIN(CIN), .tens(tens), .ones(ones), .Hex0(Hex0), .Hex1(Hex1));

initial begin 
 A = 4'b0010; B = 4'b0001; CIN = 1; 
 #10;
 A = 4'b0001; B = 4'b0000; CIN = 0; 
 #10;
 A = 4'b0011; B = 4'b0000; CIN = 1; 
 #10;
 end 
endmodule 
`timescale 1ns/1ps 

module BCD_2_tb;

reg [3:0] A,B;
reg cin;
wire [3:0] S0,S1;

BCD_2 dut (.A(A), .B(B), .cin(cin), .S0(S0), .S1(S1));

initial begin 
A = 4'b0011; B = 4'b0001; cin = 1'b1;
#10;
A = 4'b0001; B = 4'b0000; cin = 1'b0;
#10;
A = 4'b0100; B = 4'b0111; cin = 1'b1;
#10;


end 
endmodule

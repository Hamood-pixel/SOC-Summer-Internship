`timescale 1ns/1ps 

module ripple_adder_tb;

reg [3:0] A, B;
reg CIN;
wire [3:0] Sum;
wire cout;

ripple_adder dut (.A(A), .B(B), .CIN(CIN), .Sum(Sum), .cout(cout)); //instantiate 

initial begin 
A = 4'b0011 ; B = 4'b1011; CIN = 0;
#10;
A = 4'b1010 ; B = 4'b0001; CIN = 1;
#10;
A = 4'b1001 ; B = 4'b1111; CIN = 1;
#10;
end 
endmodule 


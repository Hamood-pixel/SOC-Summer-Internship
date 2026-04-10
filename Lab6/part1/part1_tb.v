`timescale 1ns/1ps 

module part1_tb; 

reg clk, reset_n;
reg [7:0] A;
wire [7:0] sum;
wire overflow,  carry; 

part1 dut (.clk(clk), .reset_n(reset_n), .A(A), .sum(sum), .overflow(overflow), .carry(carry)); 

initial begin 
clk =0; 
forever #10 clk = ~clk;
end 

initial begin 
A = 8'b00000000;
reset_n =0; 
#20; 
reset_n = 1; //reset settled 

#10; 
A = 8'b11010101; 
#20; 

A = 8'b01010111;
#20; 
$stop; 
end 
endmodule 
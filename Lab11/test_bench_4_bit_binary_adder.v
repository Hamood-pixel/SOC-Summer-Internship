`timescale 1ns/1ps 

module test_bench_4_bit_binary_adder;
reg [3:0] A, B;
reg Cin; 
wire [3:0] Sum; 
wire Cout;

four_bit_binary_adder DUT (.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));

initial begin
A = 4'b0000; B = 4'b0000; Cin = 1'b0;
#10 
A = 4'b0101; B = 4'b0011; Cin = 1'b0;
#10 
A = 4'b0111; B = 4'b1000; Cin = 1'b0;
#10 
A = 4'b1111; B = 4'b0001; Cin = 1'b0;
#10 
A = 4'b1111; B = 4'b1111; Cin = 1'b1;
#10;
end

endmodule 
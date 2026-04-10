module half_adder (input a,b, output sum, output carry);
xor (sum, a, b); 
and (carry, a,b);
endmodule 

module full_adder (input a, b, cin, output sum, cout);

wire sum1, carry1, carry2;

half_adder HA1 (.a(a), .b(b), .sum(sum1), .carry(carry1));

half_adder HA2 (.a(sum1), .b(cin), . sum(sum) , .carry(carry2));

or (cout, carry1, carry2);
endmodule 

module four_bit_binary_adder (input [3:0] A, input [3:0] B,input Cin,output [3:0] Sum,output Cout);

wire C1, C2, C3;

full_adder FA0 (.a(A[0]), .b(B[0]), .cin(Cin), .sum(Sum[0]), .cout(C1));

full_adder FA1 (.a(A[1]), .b(B[1]), .cin(C1), .sum(Sum[1]), .cout(C2));

full_adder FA2 (.a(A[2]), .b(B[2]), .cin(C2), .sum(Sum[2]), .cout(C3));

full_adder FA3 (.a(A[3]), .b(B[3]), .cin(C3), .sum(Sum[3]), .cout(Cout));
    
endmodule 
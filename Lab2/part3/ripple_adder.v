module ripple_adder (input [3:0] A, input [3:0] B, input CIN, output cout, output [3:0] Sum);
wire c1,c2,c3;

fa F1 (A[0], B[0], CIN, Sum[0],c1);  //kind of like running a function in other languages with arguments
fa F2 (A[1], B[1], c1, Sum[1], c2);
fa F3 (A[2], B[2], c2, Sum[2], c3);
fa F4 (A[3], B[3], c3, Sum[3], cout);

endmodule 

module fa (input a, input b, input cin, output sum, output carry);

assign carry = (a & b) | (a & cin) | (b & cin);

assign sum = a^b^cin;

endmodule 
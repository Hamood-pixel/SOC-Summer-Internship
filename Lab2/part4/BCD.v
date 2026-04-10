module ripple_adder (
  input [3:0] A, input [3:0] B, input CIN,
  output cout, output tens, output [3:0] ones, output [3:0] Sum,
  output [6:0] Hex0, Hex1
);

wire c1, c2, c3;
wire [4:0] total;
wire valid;

fa F1 (A[0], B[0], CIN, Sum[0], c1);
fa F2 (A[1], B[1], c1,  Sum[1], c2);
fa F3 (A[2], B[2], c2,  Sum[2], c3);
fa F4 (A[3], B[3], c3,  Sum[3], cout);

assign total = {cout, Sum};
assign valid = (total <= 5'd19);

assign tens  = valid ? ((total >= 5'd10) ? 1'b1 : 1'b0) : 1'bx;
assign ones  = valid ? ((total >= 5'd10) ? (total - 5'd10) : total[3:0]) : 4'bxxxx;

assign Hex0 = valid ? (
 (ones == 4'd0) ? 7'b0111111 :
 (ones == 4'd1) ? 7'b0000110 :
 (ones == 4'd2) ? 7'b1011011 :
 (ones == 4'd3) ? 7'b1001111 :
 (ones == 4'd4) ? 7'b1100110 :
 (ones == 4'd5) ? 7'b1101101 :
 (ones == 4'd6) ? 7'b1111101 :
 (ones == 4'd7) ? 7'b0000111 :
 (ones == 4'd8) ? 7'b1111111 :
 (ones == 4'd9) ? 7'b1101111 :
                  7'bxxxxxxx
) : 7'bxxxxxxx;

assign Hex1 = valid ? (
 (tens == 1'b0) ? 7'b0111111 :
 (tens == 1'b1) ? 7'b0000110 :
                  7'bxxxxxxx
) : 7'bxxxxxxx;

endmodule

module fa (input a, input b, input cin, output sum, output carry);
assign sum = a ^ b ^ cin;
assign carry = (a & b) | (a & cin) | (b & cin);
endmodule



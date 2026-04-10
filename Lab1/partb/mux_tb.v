`timescale 1ns/1ps

module mux_tb;

  reg [3:0] X;
  reg [3:0] Y;
  reg select;
  wire [3:0] M;
  
  mux devutest (.X(X), .Y(Y), .select(select), .M(M));
  
  initial begin 
    X = 4'b0000; Y = 4'b1111; select = 0; #10;
	 X = 4'b0000; Y = 4'b1111; select = 1; #10;
	 X = 4'b0101; Y = 4'b1010; select = 0; #10;
	 X = 4'b0101; Y = 4'b1010; select = 1; #10;
   end
	
endmodule 
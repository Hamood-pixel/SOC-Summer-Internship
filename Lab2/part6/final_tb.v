`timescale 1ns/1ps 

module final_tb;

reg [5:0] inp;
wire [3:0] tens, ones;
wire [6:0] Hex0, Hex1;

final dut (.inp(inp), .tens(tens), .ones(ones), .Hex0(Hex0), .Hex1(Hex1));

initial begin 
 inp = 6'b101010; 
 #10;
 inp = 6'b111111;
 #10;
 inp = 6'b000011;
 #10;
end 
endmodule 
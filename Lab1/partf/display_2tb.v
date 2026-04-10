`timescale 1ns/1ps 

module display_2tb;

//declare the signals 
reg [9:7] SW;
wire [5:0] Hex0, Hex1, Hex2, Hex3, Hex4, Hex5; //7 bit output 

display_2 dut (.SW(SW), .Hex0(Hex0), .Hex1(Hex1),.Hex2(Hex2),.Hex3(Hex3),.Hex4(Hex4),.Hex5(Hex5));

initial begin 
 $display("Manual Testing the SW[9:7] settings");
 
 SW = 3'b000;
 #10;
 $display("SW = 000 -> HEX5 = %b", Hex5);
 
 SW = 3'b001;
 #10;
 $display("SW = 001 -> HEX4 = %b", Hex4);
 
 SW = 3'b010;
 #10;
 $display("SW = 010 -> HEX3 = %b", Hex3);
 
 SW = 3'b011;
 #10;
 $display("SW = 011 -> HEX2 = %b", Hex2);
 
 SW = 3'b100;
 #10;
 $display("SW = 100 -> HEX1 = %b", Hex1);
 
 SW = 3'b101;
 #10;
 $display("SW = 101 -> HEX0 = %b", Hex0);
 
 $display("testing is complete");
 $stop;
end
endmodule 
 
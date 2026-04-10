`timescale 1ns/1ps 

module display_tb;

reg [3:0] SW1; //inp 
reg [7:4] SW2; //inp 
wire [6:0] Hex0,Hex1; //output of DUT 

display dut (.SW1(SW1) , .SW2(SW2) , .Hex0(Hex0) , .Hex1(Hex1)); //initializing 

initial begin 
 SW1 = 4'b0000; //checking if Hex0 is outputting to 0 
 #10; //delay 
 SW2 = 4'b0101; 
 #10;
 SW1 = 4'b1111;
 #10;
 SW2 = 4'b0111;
 #10;
 end 
endmodule 


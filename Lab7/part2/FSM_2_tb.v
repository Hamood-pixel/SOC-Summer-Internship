`timescale 1ns/1ps 

module FSM_2_tb;

wire LEDRo;
wire [3:0] LEDR;
reg w;
reg clk;
reg reset;

FSM_2 dut (.LEDRo(LEDRo), .LEDR(LEDR), .w(w), .clk(clk), .reset(reset));

initial begin //clock generation, use initial begin so it runs forever not always cuz that works only once 
clk = 0;
forever #5 clk = ~clk;
end 

initial begin 

w = 0; reset = 0;
#12;
reset = 1; //bring reset out of reset 

#10;

repeat(4) begin 
 w = 0;
 #10;
end 

repeat(5) begin 
 w = 1;
 #10;
end 

#50;
$stop;
end

endmodule 

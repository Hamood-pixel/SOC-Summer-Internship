`timescale 1ns/1ps 

module morse_tb; 


reg clk, reset, start;
reg [2:0] SW;
wire LEDR; 

morse dut (.clk(clk), .reset(reset), .start(start), .SW(SW), .LEDR(LEDR));

initial begin 
clk =0; 
forever #5 clk = ~clk;
end 

initial begin 
reset = 1; 
start = 0;
SW = 3'b000;
#20;
reset = 0;  //FSM is in idle state now 

#20;

start = 1;
#20; 
start = 0; //release start 

#500_000_000; //wait 0.5s for all the other stuff

SW = 3'b010;
start = 1; 
#20;
start = 0;

#2_000_000_000; // wait for 2s 


SW = 3'b111;
start = 1;
#20;
start = 0;  //close the signal to prevent restarting of the FSM 

#2_000_000_000;

$stop;
end 

endmodule

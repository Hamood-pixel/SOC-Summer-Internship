`timescale 1ns/1ps 

module counter_pt2_tb;

reg enable, clear, clk; 
wire [15:0] register; 

counter_pt2 dut (.enable(enable), .clear(clear), .clk(clk), .register(register));

initial begin  //clock generation 
clk = 0;

forever #5 clk = ~clk;
end 

initial begin 

enable =0; 
clear =1; 

#20; //2 clockcyles to flush out the register 

clear = 0; 

#10;

enable = 1; //value starts getting stored as counter is working

#100; //run for 10 cycles 

enable =0; 
#20; //pause for 2 cycles 

enable =1; 
#50; //again counting started 

enable =0; 
clear = 1; 
#20; //2 cycles to clear 

$stop;
end 
endmodule 

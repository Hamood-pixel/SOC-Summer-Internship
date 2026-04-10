`timescale 1ns/1ps 

module FSM_tbact;

reg in, reset,clk;
wire x;
wire [8:0] LEDR;
wire LEDRo;

FSM dut (.in(in), .reset(reset), .clk(clk), .x(x), .LEDR(LEDR), .LEDRo(LEDRo));

initial begin 
clk = 0; 
forever #5 clk = ~clk;
end  

initial begin 
reset = 0; in = 0;
#12 reset = 1 ;  //this ensures the FSM doesn't start at a random state. if reset is 0, in 5ns the state goes to A but then at 15ns another state change is ready so to prevent that and to start on A only you'll change to 1 to prevent state change. active low signal 

repeat(5) begin 
in = 0;
#10;
end 

#10; //check the x and LEDR 

repeat(4) begin 
in = 1;
#10;
end 
#10;

$stop; 

end 

endmodule 

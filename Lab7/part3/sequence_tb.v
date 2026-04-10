`timescale 1ns/1ps 

module sequence_tb;

reg w, clk, reset;
wire z;
wire [3:0] zeros; 
wire [3:0] ones;

sequence dut (.w(w), .clk(clk), .reset(reset), .z(z), .zeros(zeros), .ones(ones));

initial begin 
clk =0;
forever #5 clk = ~clk; //10ns ka time period 
end 



initial begin 
w=0; reset =0;

#12; reset =1; //reset to 1

repeat(4) begin 
w=0; 
#10;
end 
repeat(4) begin 
w=1;
#10;
end 
$stop;

end
endmodule 
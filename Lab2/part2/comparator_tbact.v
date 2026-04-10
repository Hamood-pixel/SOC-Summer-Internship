`timescale 1ns/1ps 

module comparator_tbact;

reg [3:0] V;
wire z;
wire [6:0] d0,d1;

comparator dut (.V(V), .z(z), .d0(d0), .d1(d1));

initial begin 
 $display("Testing to begin: ");
 V = 4'b0001;
 #10;
 V = 4'b0010; 
 #10;
 V = 4'b1010;
 #10;
 V = 4'b1011;
 #10;
 V = 4'b1100;
 #10;
 end 
endmodule 
module counter_pt2 (input enable, clear, clk, output reg [15:0] register); 

always @(posedge clk) begin 
 if(clear) 
  register <= 16'b0; //whenever assigning a value inside the always block, use reg 
 else if(enable) 
  register <= register +1;
end 

endmodule 

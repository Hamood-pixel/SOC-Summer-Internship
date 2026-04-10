module sequence (input w, clk,reset, output reg z, output [3:0] zeros, ones);

reg [3:0] shift_zeros;
reg [3:0] shift_ones;

assign zeros = shift_zeros;
assign ones = shift_ones;

always @(posedge clk or negedge reset) begin 
 if(!reset) begin
  shift_zeros <= 4'b0000;
  shift_ones <= 4'b0000;
  z <= 0;
  
 end else begin 
  shift_zeros <= {shift_zeros[2:0] , ~w}; //shift inverted  
  shift_ones <= {shift_ones[2:0], w};
  
 if(shift_zeros == 4'b1111 || shift_ones  == 4'b1111) 
  z <= 1'b1;
  
 else 
  z <= 1'b0;
 end 
end 

endmodule 

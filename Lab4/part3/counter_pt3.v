module counter_pt3 (input clk, reset, output reg [6:0] HEX);

reg [25:0] big_counter; 
reg [3:0] digit_counter; 
reg enable;

always @(posedge clk) begin 
  if (reset) begin
    big_counter <= 26'd0;
    enable <= 1'b0;
  end else begin 
    if (big_counter == 26_000_000 - 1) begin
      big_counter <= 26'd0;
      enable <= 1'b1;
    end else begin 
      big_counter <= big_counter + 1;
      enable <= 1'b0;
    end 
  end
end 

always @(posedge clk) begin 
  if (reset) begin
    digit_counter <= 4'd0;
  end else if (enable) begin
    if (digit_counter == 4'd9)
      digit_counter <= 4'd0;
    else 
      digit_counter <= digit_counter + 1;
  end
end  

always @(*) begin 
  case (digit_counter) 
    4'd0: HEX = 7'b1000000; // active-low 0
    4'd1: HEX = 7'b1111001;
    4'd2: HEX = 7'b0100100;
    4'd3: HEX = 7'b0110000;
    4'd4: HEX = 7'b0011001;
    4'd5: HEX = 7'b0010010;
    4'd6: HEX = 7'b0000010;
    4'd7: HEX = 7'b1111000;
    4'd8: HEX = 7'b0000000;
    4'd9: HEX = 7'b0010000;
    default: HEX = 7'b1111111; // blank display
  endcase 
end 

endmodule

  
  
	 
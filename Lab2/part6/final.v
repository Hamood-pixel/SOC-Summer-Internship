module final (input [5:0] inp, output reg [3:0] tens, ones, output [6:0] Hex0,Hex1);
//hard assigning all the inputs, way too tedious though 

always @(*) begin 
 case(inp)
        6'd0: begin tens = 4'd0; ones = 4'd0; end //using begin and end in each statement due to two assignments
        6'd1:  begin tens = 4'd0; ones = 4'd1; end
        6'd2:  begin tens = 4'd0; ones = 4'd2; end
        6'd3:  begin tens = 4'd0; ones = 4'd3; end
        6'd4:  begin tens = 4'd0; ones = 4'd4; end
        6'd5:  begin tens = 4'd0; ones = 4'd5; end
        6'd6:  begin tens = 4'd0; ones = 4'd6; end
        6'd7:  begin tens = 4'd0; ones = 4'd7; end
        6'd8:  begin tens = 4'd0; ones = 4'd8; end
        6'd9:  begin tens = 4'd0; ones = 4'd9; end
        6'd10: begin tens = 4'd1; ones = 4'd0; end
        6'd11: begin tens = 4'd1; ones = 4'd1; end
        6'd12: begin tens = 4'd1; ones = 4'd2; end
        6'd13: begin tens = 4'd1; ones = 4'd3; end
        6'd14: begin tens = 4'd1; ones = 4'd4; end
        6'd15: begin tens = 4'd1; ones = 4'd5; end
        6'd16: begin tens = 4'd1; ones = 4'd6; end
        6'd17: begin tens = 4'd1; ones = 4'd7; end
        6'd18: begin tens = 4'd1; ones = 4'd8; end
        6'd19: begin tens = 4'd1; ones = 4'd9; end
        6'd20: begin tens = 4'd2; ones = 4'd0; end
        6'd21: begin tens = 4'd2; ones = 4'd1; end
        6'd22: begin tens = 4'd2; ones = 4'd2; end
        6'd23: begin tens = 4'd2; ones = 4'd3; end
        6'd24: begin tens = 4'd2; ones = 4'd4; end
        6'd25: begin tens = 4'd2; ones = 4'd5; end
        6'd26: begin tens = 4'd2; ones = 4'd6; end
        6'd27: begin tens = 4'd2; ones = 4'd7; end
        6'd28: begin tens = 4'd2; ones = 4'd8; end
        6'd29: begin tens = 4'd2; ones = 4'd9; end
        6'd30: begin tens = 4'd3; ones = 4'd0; end
        6'd31: begin tens = 4'd3; ones = 4'd1; end
        6'd32: begin tens = 4'd3; ones = 4'd2; end
        6'd33: begin tens = 4'd3; ones = 4'd3; end
        6'd34: begin tens = 4'd3; ones = 4'd4; end
        6'd35: begin tens = 4'd3; ones = 4'd5; end
        6'd36: begin tens = 4'd3; ones = 4'd6; end
        6'd37: begin tens = 4'd3; ones = 4'd7; end
        6'd38: begin tens = 4'd3; ones = 4'd8; end
        6'd39: begin tens = 4'd3; ones = 4'd9; end
        6'd40: begin tens = 4'd4; ones = 4'd0; end
        6'd41: begin tens = 4'd4; ones = 4'd1; end
        6'd42: begin tens = 4'd4; ones = 4'd2; end
        6'd43: begin tens = 4'd4; ones = 4'd3; end
        6'd44: begin tens = 4'd4; ones = 4'd4; end
        6'd45: begin tens = 4'd4; ones = 4'd5; end
        6'd46: begin tens = 4'd4; ones = 4'd6; end
        6'd47: begin tens = 4'd4; ones = 4'd7; end
        6'd48: begin tens = 4'd4; ones = 4'd8; end
        6'd49: begin tens = 4'd4; ones = 4'd9; end
        6'd50: begin tens = 4'd5; ones = 4'd0; end
        6'd51: begin tens = 4'd5; ones = 4'd1; end
        6'd52: begin tens = 4'd5; ones = 4'd2; end
        6'd53: begin tens = 4'd5; ones = 4'd3; end
        6'd54: begin tens = 4'd5; ones = 4'd4; end
        6'd55: begin tens = 4'd5; ones = 4'd5; end
        6'd56: begin tens = 4'd5; ones = 4'd6; end
        6'd57: begin tens = 4'd5; ones = 4'd7; end
        6'd58: begin tens = 4'd5; ones = 4'd8; end
        6'd59: begin tens = 4'd5; ones = 4'd9; end
        6'd60: begin tens = 4'd6; ones = 4'd0; end
        6'd61: begin tens = 4'd6; ones = 4'd1; end
        6'd62: begin tens = 4'd6; ones = 4'd2; end
        6'd63: begin tens = 4'd6; ones = 4'd3; end
        default: begin tens = 4'd0; ones = 4'd0; end
		  endcase
end

assign Hex0 = 
  (ones == 4'd0) ? 7'b1000000 : // 0
  (ones == 4'd1) ? 7'b1111001 : // 1
  (ones == 4'd2) ? 7'b0100100 : // 2
  (ones == 4'd3) ? 7'b0110000 : // 3
  (ones == 4'd4) ? 7'b0011001 : // 4
  (ones == 4'd5) ? 7'b0010010 : // 5
  (ones == 4'd6) ? 7'b0000010 : // 6
  (ones == 4'd7) ? 7'b1111000 : // 7
  (ones == 4'd8) ? 7'b0000000 : // 8
  (ones == 4'd9) ? 7'b0010000 : // 9
                   7'b1111111;   // default (blank or error)
assign Hex1 = 
  (tens == 4'd0) ? 7'b1000000 : // 0
  (tens == 4'd1) ? 7'b1111001 : // 1
  (tens == 4'd2) ? 7'b0100100 : // 2
  (tens == 4'd3) ? 7'b0110000 : // 3
  (tens == 4'd4) ? 7'b0011001 : // 4
  (tens == 4'd5) ? 7'b0010010 : // 5
  (tens == 4'd6) ? 7'b0000010 : // 6
                   7'b1111111 ;  


endmodule 



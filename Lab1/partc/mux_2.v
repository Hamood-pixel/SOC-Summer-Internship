module mux_2 (input [3:0] u, input [3:0] v, input [3:0] w, input [3:0] x, input [1:0] sel, output reg [3:0] m);

always @(*) begin
 case(sel)
  2'b00: m = u;
  2'b01: m = v;
  2'b10: m = w;
  2'b11: m = x;
  endcase 
end 
endmodule 
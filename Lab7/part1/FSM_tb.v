module FSM (input clk, input in, input reset, output x, output [8:0] LEDR, output LEDRo);

parameter A = 9'b000000001; //one hot encoded  states 
parameter B = 9'b000000010;
parameter C = 9'b000000100;
parameter D = 9'b000001000;
parameter E = 9'b000010000;
parameter F = 9'b000100000;
parameter G = 9'b001000000;
parameter H = 9'b010000000;
parameter I = 9'b100000000;



reg [8:0] state; //reg defined due to state being stored in FSM for full clk cycle 
wire [8:0] next_state; //wire defined due to next_state being fully combinational

always @(posedge clk) begin 
  if(~reset) //when reset is 0 this if block gets executed due to it being an active low signal  
   state <= A;
  else 
   state <=next_state;
end 

assign next_state = 
 (state == A) ? (in ? F : B) : 
 (state == B) ? (in ? F : C) :
 (state == C) ? (in ? F : D) : 
 (state == D) ? (in ? F : E) :
 (state == E) ? (in ? F : E) : 
 (state == F) ? (in ? G : B) :
 (state == G) ? (in ? H : B) : 
 (state == H) ? (in ? I : B) : 
 (state == I) ? (in ? I : B) : 
 A; // cuz reset to this 
  
assign LEDR = state; //shows the one-hot encoding of all the states 

assign x = (state == E) || (state == I);
assign LEDRo = x;

endmodule  
module FSM_2 (input w, input reset, input clk, output z, output [3:0] LEDR, output LEDRo);

reg [3:0] c_state, n_state;
parameter A = 4'b0000, B = 4'b0001, C = 4'b0010, D = 4'b0011, E = 4'b0100, F = 4'b0101, G = 4'b0110, H = 4'b0111, I = 4'b1000;

always @(w, c_state)
begin
  case (c_state)
    A: if (!w) n_state = B;
       else    n_state = F; //next state is computed in combinational block not sequential. later in clock sync you change c_state to n_state using clk siganl
       
    B: if (!w) n_state = C;
       else    n_state = F;
       
    C: if (!w) n_state = D;
       else    n_state = F;
       
    D: if (!w) n_state = E;
       else    n_state = F;
       
    E: if (w)  n_state = F;
       else    n_state = E;
       
    F: if (!w) n_state = B;
       else    n_state = G;
       
    G: if (!w) n_state = B;
       else    n_state = H;
       
    H: if (!w) n_state = B;
       else    n_state = I;
       
    I: if (!w) n_state = B;
       else    n_state = I;
       
    default:   n_state = A;
  endcase
end 

always @(posedge clk or negedge reset) 
begin
 if(!reset) 
    c_state <=A;
 else 
   c_state <= n_state;
end 

assign LEDR = c_state;

assign z = (c_state == E) || (c_state == I);
assign LEDRo = z;

endmodule 

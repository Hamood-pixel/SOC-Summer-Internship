module seg (input c0, input c1, output [0:6] HEX0);

assign HEX0[0] = ~(~c1 & c0);
assign HEX0[1] =  ~((~c1 & ~c0) | (c1 & ~c0));
assign HEX0[2] =  ~((~c1 & ~c0) | (c1 & ~c0));
assign HEX0[3] = ~( (~c1 & ~c0) | (~c1 & c0) );
assign HEX0[4] = ~( (~c1 & ~c0) | (~c1 & c0) );
assign HEX0[5] = ~(~c1 & c0);
assign HEX0[6] = ~( (~c1 & ~c0) | (~c1 & c0) );

endmodule

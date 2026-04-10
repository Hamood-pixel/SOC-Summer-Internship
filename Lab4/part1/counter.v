module counter (
    input clk, clear, enable,
    output [7:0] Q
);

wire [7:0] T;

assign T[0] = enable;
assign T[1] = enable & Q[0];
assign T[2] = enable & Q[0] & Q[1];
assign T[3] = enable & Q[0] & Q[1] & Q[2];
assign T[4] = enable & Q[0] & Q[1] & Q[2] & Q[3];
assign T[5] = enable & Q[0] & Q[1] & Q[2] & Q[3] & Q[4];
assign T[6] = enable & Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5];
assign T[7] = enable & Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5] & Q[6];

T_ff ff0 (.clk(clk), .clear(clear), .T(T[0]), .Q(Q[0]));
T_ff ff1 (.clk(clk), .clear(clear), .T(T[1]), .Q(Q[1]));
T_ff ff2 (.clk(clk), .clear(clear), .T(T[2]), .Q(Q[2]));
T_ff ff3 (.clk(clk), .clear(clear), .T(T[3]), .Q(Q[3]));
T_ff ff4 (.clk(clk), .clear(clear), .T(T[4]), .Q(Q[4]));
T_ff ff5 (.clk(clk), .clear(clear), .T(T[5]), .Q(Q[5]));
T_ff ff6 (.clk(clk), .clear(clear), .T(T[6]), .Q(Q[6]));
T_ff ff7 (.clk(clk), .clear(clear), .T(T[7]), .Q(Q[7]));

endmodule

module T_ff(
    input clk, clear, T,
    output reg Q
);
always @(posedge clk) begin
    if (~clear)
        Q <= 1'b0; //Q gets flushed to zero by using clear
    else if (T)
        Q <= ~Q;
end
endmodule


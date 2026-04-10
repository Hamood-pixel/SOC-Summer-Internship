`timescale 1ns/1ps 

module mux_tb;

reg [3:0] u;
reg [3:0] v;
reg [3:0] w;
reg [3:0] x;
reg [1:0] sel;
wire [3:0] m;

mux_2 device_under_testing (.u(u),.v(v),.w(w),.x(x), .sel(sel), .m(m)); //instantiate 

initial begin 
 u = 4'b0000; v = 4'b0101;  w= 4'b1111; x = 4'b0111;
 sel = 2'b00; #10;
 sel = 2'b01; #10;
 sel = 2'b10; #10;
 sel = 2'b11; #10;
end 
endmodule


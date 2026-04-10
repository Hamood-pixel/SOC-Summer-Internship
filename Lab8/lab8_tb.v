`timescale 1ns/1ps

module lab8_tb;

reg [2:0] inp;
wire [6:0] LED_O;

lab8 dut (.inp(inp),.LED_O(LED_O));

initial begin

#10;

inp = 3'b000;

#10;

inp = 3'b001;

#10;

inp = 3'b010;

#10;

inp = 3'b011;

#10; 

inp = 3'b100;

#10;

inp = 3'b101;

#10; 

inp = 3'b110;

#10;

inp = 3'b111;

#10;
end

endmodule

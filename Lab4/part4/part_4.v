module part_4 (input wire reset, input wire clock_50, output reg [6:0] hex3, hex2,hex1,hex0);

reg [25:0] count;  //counter for 1 second 
reg enable; 
reg [1:0] rot_counter; //rotation counter for the rotatory motion, 00, 01, 10, 11

always @(posedge clock_50) begin 
 if(reset) begin
  count <= 0;
  enable <= 0;
 end else if (count == 26'd5 -1) begin //did 5 decimal for the ease of simulation else itll take a long time for even one enable to be high
  enable <= 1;
  count <=0;
 end else begin 
  enable <= 0;
  count <= count + 1;
 end 
end 

always @(posedge clock_50)  begin
 if(reset) 
  rot_counter <= 0; 
 else if (enable)
  rot_counter <= rot_counter +1;
end 

function [6:0] seg7;
 input [7:0] char; //in verilog the characters are stored as 8-bits like 0 has a byte representation 
 begin
 case (char)  
  "0": seg7 = 7'b1000000;
  "1": seg7 = 7'b1111001;
  "E": seg7 = 7'b0000110;
  "d": seg7 = 7'b0100001;
  default: seg7 = 7'b1111111;
endcase 
end
endfunction 

reg [7:0] word [0:3]; //4 positional array which stores 8 bits of things like de10 
initial begin
 word[0] = "d";
 word[1] = "E";
 word[2] = "1";
 word[3] = "0";
end 
 
always @(*) begin 
hex3 = seg7(word[(0 + rot_counter) %4]); //%4 is for wrapping around and no off bound  
hex2 = seg7(word[(1 + rot_counter) %4]);
hex1 = seg7(word[(2 + rot_counter) %4]);
hex0 = seg7(word[(3 + rot_counter) %4]);
end 
endmodule 
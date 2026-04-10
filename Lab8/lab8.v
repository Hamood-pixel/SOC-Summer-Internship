module lab8 (input  [2:0] inp, output [6:0] LED_O);

assign LED_O = (inp == 3'b001) ? 7'b0100000: 
               (inp == 3'b010) ? 7'b0001101: 
               (inp == 3'b011) ? 7'b0001011: 
               (inp == 3'b100) ? 7'b1100001: 
               (inp == 3'b101) ? 7'b1011011: 
               (inp == 3'b110) ? 7'b1111011: 
                                 7'b0000000;

endmodule 

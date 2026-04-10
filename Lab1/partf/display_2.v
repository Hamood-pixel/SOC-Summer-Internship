module display_2 (input [9:7] SW, output [6:0] Hex0, Hex1, Hex2, Hex3, Hex4, Hex5);

    wire [2:0] code0, code1, code2, code3, code4, code5;
    wire [6:0] seg0, seg1, seg2, seg3, seg4, seg5;

    reg [2:0] op[5:0];

    always @(*) begin
  case (SW[9:7])
    3'b000: begin
      op[0] = 3'b000; 
      op[1] = 3'b001; 
      op[2] = 3'b010; 
      op[3] = 3'b011; 
      op[4] = 3'b100; 
      op[5] = 3'b100; 
    end
    3'b001: begin
      op[0] = 3'b001;
      op[1] = 3'b010;
      op[2] = 3'b011;
      op[3] = 3'b100;
      op[4] = 3'b100;
      op[5] = 3'b000;
    end
    3'b010: begin
      op[0] = 3'b010;
      op[1] = 3'b011;
      op[2] = 3'b100;
      op[3] = 3'b100;
      op[4] = 3'b000;
      op[5] = 3'b001;
    end
    3'b011: begin
      op[0] = 3'b011;
      op[1] = 3'b100;
      op[2] = 3'b100;
      op[3] = 3'b000;
      op[4] = 3'b001;
      op[5] = 3'b010;
    end
    3'b100: begin
      op[0] = 3'b100;
      op[1] = 3'b100;
      op[2] = 3'b000;
      op[3] = 3'b001;
      op[4] = 3'b010;
      op[5] = 3'b011;
    end
    3'b101: begin
      op[0] = 3'b100;
      op[1] = 3'b000;
      op[2] = 3'b001;
      op[3] = 3'b010;
      op[4] = 3'b011;
      op[5] = 3'b100;
    end
    default: begin
      op[0] = 3'b100;
      op[1] = 3'b100;
      op[2] = 3'b100;
      op[3] = 3'b100;
      op[4] = 3'b100;
      op[5] = 3'b100;
    end
  endcase
end


    assign code0 = op[0];
    assign code1 = op[1];
    assign code2 = op[2];
    assign code3 = op[3];
    assign code4 = op[4];
    assign code5 = op[5];

    decoder d0(code0, seg0);
    decoder d1(code1, seg1);
    decoder d2(code2, seg2);
    decoder d3(code3, seg3);
    decoder d4(code4, seg4);
    decoder d5(code5, seg5);

    assign Hex0 = seg0;
    assign Hex1 = seg1;
    assign Hex2 = seg2;
    assign Hex3 = seg3;
    assign Hex4 = seg4;
    assign Hex5 = seg5;

endmodule

module decoder(input [2:0] q, output reg [6:0] Hex);
    always @(*) begin
        case (q)
            3'b000: Hex = 7'b1011110; // d
            3'b001: Hex = 7'b1111001; // E
            3'b010: Hex = 7'b0000110; // 1
            3'b011: Hex = 7'b0111111; // 0
            3'b100: Hex = 7'b0000000; // blank
            default: Hex = 7'b0000000;
        endcase
    end
endmodule

  
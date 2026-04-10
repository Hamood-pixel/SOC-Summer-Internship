module part_5 (
    input wire reset,
    input wire clock_50,
    output reg [6:0] hex5, hex4, hex3, hex2, hex1, hex0
);

    reg [25:0] count;  
    reg enable;        
    reg [2:0] rot_counter; 

    always @(posedge clock_50) begin 
        if (reset) begin
            count <= 0;
            enable <= 0;
        end 
        else if (count == 26'd5 - 1) begin   //did 5 clock cycles to make enable high just for the simulation
            enable <= 1;
            count <= 0;
        end 
        else begin 
            enable <= 0;
            count <= count + 1;
        end 
    end 

    always @(posedge clock_50) begin
        if (reset)
            rot_counter <= 0; 
        else if (enable)
            rot_counter <= rot_counter + 1;  
    end 

    function [6:0] seg7;
        input [7:0] char;
        begin
            case (char)  
                "0": seg7 = 7'b1000000;
                "1": seg7 = 7'b1111001;
                "E": seg7 = 7'b0000110;
                "d": seg7 = 7'b0100001;
                " ": seg7 = 7'b1111111; 
                default: seg7 = 7'b1111111;
            endcase 
        end
    endfunction 

    reg [7:0] word [0:5]; 
    initial begin
        word[0] = "d";
        word[1] = "E";
        word[2] = "1";
        word[3] = "0";
        word[4] = " ";
        word[5] = " "; 
    end 

    always @(*) begin
        hex5 = seg7(word[(0 + rot_counter) % 6]);
        hex4 = seg7(word[(1 + rot_counter) % 6]);
        hex3 = seg7(word[(2 + rot_counter) % 6]);
        hex2 = seg7(word[(3 + rot_counter) % 6]);
        hex1 = seg7(word[(4 + rot_counter) % 6]);
        hex0 = seg7(word[(5 + rot_counter) % 6]);
    end 

endmodule

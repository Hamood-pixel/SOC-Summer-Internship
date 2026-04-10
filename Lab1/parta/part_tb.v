`timescale 1ns/1ps //setting the time delay between each simulation to analyze 
module part1_tb();

    reg [9:0] SW;
    wire [9:0] LEDR;
	 
    Testing uut (.SW(SW) , .LEDR(LEDR)); //Instantiating 
    
    initial begin
        SW = 10'b0000000000;
        #10; //time delay
        
        SW = 10'b1010101010;
        #10;
        
        SW = 10'b1111111111;
        #10;
        
        SW = 10'b0111010101;
        #10;
        
        SW = 10'b0111100010;
        #10;
        
        $finish;
    end
endmodule
  
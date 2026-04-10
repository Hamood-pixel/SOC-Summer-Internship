`timescale 1ns/1ps 

module counter_tb;

reg enable, clk, clear;
wire [7:0] Q;

counter uut (.clk(clk),.enable(enable),.clear(clear),.Q(Q));

initial begin 
clk =0; 
forever #5 clk = ~clk; //after 10ns your clk changes to ~clk so full timeperiod is 10ps 
end 

initial begin
        enable = 0;
        clear = 1;

        #20;
        
        clear = 0;   // release reset
        enable = 1;  // start counting

        #100;        // count for 100ns
        
        enable = 0;  // pause counting
        #20;

        enable = 1;  // resume counting
        #50;

        clear = 1;   // reset the counter by flushing the stored binary values 
        #10;
        clear = 0;

        #50;

        $stop;
    end

endmodule
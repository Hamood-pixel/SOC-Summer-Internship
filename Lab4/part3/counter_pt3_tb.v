`timescale 1ns/1ps

module counter_pt3_tb;

  reg clk, reset;
  wire [6:0] HEX;
  wire [3:0] digit_counter;

  // Instantiate the DUT
  counter_pt3 dut (
    .clk(clk),
    .reset(reset),
    .HEX(HEX),
    .digit_counter(digit_counter)
  );

  // Generate 50 MHz clock (period = 20 ns)
  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end

  // Stimulus
  initial begin
    reset = 1;
    #100;      // hold reset for 100 ns
    reset = 0;

    // Run for ~12 seconds to observe multiple digits
    #12_000_000_000;

    $stop;
  end

endmodule


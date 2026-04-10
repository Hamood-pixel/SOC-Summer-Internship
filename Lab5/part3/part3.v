module part3 (
    input clock_50,
    input reset_n,
    input key0,       // pause/resume
    input key1,       // preset minutes
    input [7:0] sw,   // minute preset
    output [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0
);

    reg [25:0] tick_count;
    reg tick_100hz;
    reg pause;

    reg [3:0] hundredths_ones, hundredths_tens;
    reg [3:0] seconds_ones, seconds_tens;
    reg [3:0] minutes_ones, minutes_tens;

    localparam TICK_MAX = 26'd500000; // 50 MHz / 100 = 500,000

    always @(posedge clock_50 or negedge reset_n) begin
        if (!reset_n) begin
            tick_count <= 0;
            tick_100hz <= 0;
        end else begin
            if (tick_count == TICK_MAX - 1) begin
                tick_count <= 0;
                tick_100hz <= 1;
            end else begin
                tick_count <= tick_count + 1;
                tick_100hz <= 0;
            end
        end
    end

    always @(posedge clock_50 or negedge reset_n) begin
        if (!reset_n)
            pause <= 0;
        else
            pause <= ~key0; // active-low pause button
    end

    always @(posedge clock_50 or negedge reset_n) begin
        if (!reset_n) begin
            hundredths_ones <= 0;
            hundredths_tens <= 0;
            seconds_ones <= 0;
            seconds_tens <= 0;
            minutes_ones <= 0;
            minutes_tens <= 0;
        end else if (~key1) begin
            minutes_tens <= sw[7:4];
            minutes_ones <= sw[3:0];
        end else if (tick_100hz && !pause) begin
            if (hundredths_ones == 9) begin
                hundredths_ones <= 0;
                if (hundredths_tens == 9) begin
                    hundredths_tens <= 0;
                    if (seconds_ones == 9) begin
                        seconds_ones <= 0;
                        if (seconds_tens == 5) begin
                            seconds_tens <= 0;
                            if (minutes_ones == 9) begin
                                minutes_ones <= 0;
                                if (minutes_tens == 5)
                                    minutes_tens <= 0;
                                else
                                    minutes_tens <= minutes_tens + 1;
                            end else
                                minutes_ones <= minutes_ones + 1;
                        end else
                            seconds_tens <= seconds_tens + 1;
                    end else
                        seconds_ones <= seconds_ones + 1;
                end else
                    hundredths_tens <= hundredths_tens + 1;
            end else
                hundredths_ones <= hundredths_ones + 1;
        end
    end

    hex_decoder h5 (minutes_tens, HEX5);
    hex_decoder h4 (minutes_ones, HEX4);
    hex_decoder h3 (seconds_tens, HEX3);
    hex_decoder h2 (seconds_ones, HEX2);
    hex_decoder h1 (hundredths_tens, HEX1);
    hex_decoder h0 (hundredths_ones, HEX0);

endmodule

module hex_decoder (
    input [3:0] in,
    output reg [6:0] out
);
    always @(*) begin
        case (in)
            4'd0: out = 7'b1000000;
            4'd1: out = 7'b1111001;
            4'd2: out = 7'b0100100;
            4'd3: out = 7'b0110000;
            4'd4: out = 7'b0011001;
            4'd5: out = 7'b0010010;
            4'd6: out = 7'b0000010;
            4'd7: out = 7'b1111000;
            4'd8: out = 7'b0000000;
            4'd9: out = 7'b0010000;
            default: out = 7'b1111111;
        endcase
    end
endmodule

module part4(
    input clk,
    input reset_n,
    input start,
    input [2:0] letter,
    output reg LEDR0
);

    localparam DOT_TICKS  = 25_000_000;
    localparam DASH_TICKS = 75_000_000;
    localparam GAP_TICKS  = 25_000_000;

    reg [6:0] morse_patterns [0:7];
    initial begin
        morse_patterns[0] = {3'd2, 4'b01  };
        morse_patterns[1] = {3'd4, 4'b1000};
        morse_patterns[2] = {3'd4, 4'b1010};
        morse_patterns[3] = {3'd3, 4'b100 };
        morse_patterns[4] = {3'd1, 4'b0   };
        morse_patterns[5] = {3'd4, 4'b0010};
        morse_patterns[6] = {3'd3, 4'b110 };
        morse_patterns[7] = {3'd4, 4'b0000};
    end

    reg [2:0] symbol_count;
    reg [3:0] symbols;
    reg [2:0] index; 
    reg [31:0] tick_counter;
    reg [1:0] state;

    localparam IDLE   = 2'd0;
    localparam ON     = 2'd1;
    localparam GAP    = 2'd2;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            LEDR0 <= 0;
            state <= IDLE;
            tick_counter <= 0;
            index <= 0;
            symbol_count <= 0;
            symbols <= 0;
        end 
        else begin
            case (state)
                IDLE: begin
                    LEDR0 <= 0;
                    if (start) begin
                        {symbol_count, symbols} <= morse_patterns[letter];
                        index <= 0;
                        state <= ON;
                        tick_counter <= 0;
                        LEDR0 <= 1;
                    end
                end

                ON: begin
                    if (symbols[symbol_count-1-index] == 1'b0) begin
                        if (tick_counter < DOT_TICKS-1)
                            tick_counter <= tick_counter + 1;
                        else begin
                            tick_counter <= 0;
                            LEDR0 <= 0;
                            state <= GAP;
                        end
                    end else begin
                        if (tick_counter < DASH_TICKS-1)
                            tick_counter <= tick_counter + 1;
                        else begin
                            tick_counter <= 0;
                            LEDR0 <= 0;
                            state <= GAP;
                        end
                    end
                end

                GAP: begin
                    if (tick_counter < GAP_TICKS-1)
                        tick_counter <= tick_counter + 1;
                    else begin
                        tick_counter <= 0;
                        index <= index + 1;
                        if (index < symbol_count)
                            state <= ON, LEDR0 <= 1;
                        else
                            state <= IDLE;
                    end
                end
            endcase
        end
    end
endmodule

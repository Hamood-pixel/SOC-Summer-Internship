module morse (
    input clk,
    input reset,
    input start,
    input [2:0] SW,
    output reg LEDR
);

reg [2:0] c_state;
reg [26:0] counter; // For timing
reg [3:0] pattern;
reg [2:0] length;
reg [2:0] pos;

localparam IDLE = 0, LOAD = 1, DOTON = 2, DASHON = 3, GAP = 4, DONE = 5;

// Morse pattern lookup
always @(*) begin
    case(SW)
        3'b000: begin pattern = 4'b01;   length = 2; end // A
        3'b001: begin pattern = 4'b1000; length = 4; end // B
        3'b010: begin pattern = 4'b1010; length = 4; end // C
        3'b011: begin pattern = 4'b100;  length = 3; end // D
        3'b100: begin pattern = 4'b0000; length = 1; end // E
        3'b101: begin pattern = 4'b0010; length = 4; end // F
        3'b110: begin pattern = 4'b0110; length = 3; end // G
        3'b111: begin pattern = 4'b0000; length = 4; end // H
        default: begin pattern = 4'b0000; length = 0; end
    endcase
end

// Main FSM
always @(posedge clk or posedge reset) begin
    if (reset) begin
        c_state <= IDLE;
        counter <= 0;
        LEDR <= 0;
        pos <= 0;
    end else begin
        case(c_state)
            IDLE: begin
                LEDR <= 0;
                if (start) begin
                    counter <= 0;
                    pos <= 0;
                    c_state <= LOAD;
                end
            end

            LOAD: begin
                if (pattern[length - 1 - pos] == 0)
                    c_state <= DOTON;
                else
                    c_state <= DASHON;
            end

            DOTON: begin
                LEDR <= 1;
                counter <= counter + 1;
                if (counter >= 25_000_000) begin
                    LEDR <= 0;
                    counter <= 0;
                    c_state <= GAP;
                end
            end

            DASHON: begin
                LEDR <= 1;
                counter <= counter + 1;
                if (counter >= 75_000_000) begin
                    LEDR <= 0;
                    counter <= 0;
                    c_state <= GAP;
                end
            end

            GAP: begin
                counter <= counter + 1;
                if (counter >= 25_000_000) begin
                    counter <= 0;
                    pos <= pos + 1;
                    if (pos >= length)
                        c_state <= DONE;
                    else
                        c_state <= LOAD;
                end
            end

            DONE: begin
                LEDR <= 0;
                if (!start)
                    c_state <= IDLE;
            end
        endcase
    end
end

endmodule

	
	
	  
	  
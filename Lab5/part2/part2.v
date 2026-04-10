module bcd_counter_3digit (
    input clock_50,
    input reset_n,
    output [6:0] HEX2, HEX1, HEX0
);

    wire enable_1s, en1, en2;
    wire [3:0] d0, d1, d2;

    counter #(.n(26), .k(50_000_000)) sec_counter (
        .clock(clock_50),
        .reset_n(reset_n),
        .enable(1'b1),
        .Q(),
        .rollover(enable_1s)
    );

    counter #(.n(4), .k(10)) c0 (
        .clock(clock_50),
        .reset_n(reset_n),
        .enable(enable_1s),
        .Q(d0),
        .rollover(en1)
    );

    counter #(.n(4), .k(10)) c1 (
        .clock(clock_50),
        .reset_n(reset_n),
        .enable(en1),
        .Q(d1),
        .rollover(en2)
    );

    counter #(.n(4), .k(10)) c2 (
        .clock(clock_50),
        .reset_n(reset_n),
        .enable(en2),
        .Q(d2),
        .rollover()
    );

    bcd_to_7seg disp0 (.bcd(d0), .seg(HEX0));
    bcd_to_7seg disp1 (.bcd(d1), .seg(HEX1));
    bcd_to_7seg disp2 (.bcd(d2), .seg(HEX2));

endmodule


module counter #(parameter n=4, parameter k=10) (
    input clock,
    input reset_n,
    input enable,
    output reg [n-1:0] Q,
    output reg rollover
);
    always @(posedge clock or negedge reset_n) begin
        if (!reset_n) begin
            Q <= 0;
            rollover <= 0;
        end
        else if (enable) begin
            if (Q == k-1) begin
                Q <= 0;
                rollover <= 1;
            end
            else begin
                Q <= Q + 1;
                rollover <= 0;
            end
        end
        else
            rollover <= 0;
    end
endmodule


module bcd_to_7seg(input [3:0] bcd, output reg [6:0] seg);
    always @(*) begin
        case (bcd)
            4'd0: seg = 7'b1000000;
            4'd1: seg = 7'b1111001;
            4'd2: seg = 7'b0100100;
            4'd3: seg = 7'b0110000;
            4'd4: seg = 7'b0011001;
            4'd5: seg = 7'b0010010;
            4'd6: seg = 7'b0000010;
            4'd7: seg = 7'b1111000;
            4'd8: seg = 7'b0000000;
            4'd9: seg = 7'b0010000;
            default: seg = 7'b1111111;
        endcase
    end
endmodule

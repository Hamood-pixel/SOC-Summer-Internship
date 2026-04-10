module accumulator (
    input wire clk,
    input wire reset_n,      
    input wire [7:0] A,
    output reg [7:0] sum,
    output reg carry,
    output reg overflow
);

wire [8:0] add_result;  

assign add_result = {1'b0, sum} + {1'b0, A}; 

wire overflow_wire;
assign overflow_wire = (~sum[7] & ~A[7] & add_result[7]) | (sum[7] & A[7] & ~add_result[7]);

always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
        sum <= 8'b0;
        carry <= 1'b0;
        overflow <= 1'b0;
    end else begin
        sum <= add_result[7:0];
        carry <= add_result[8];
        overflow <= overflow_wire;
    end
end

endmodule

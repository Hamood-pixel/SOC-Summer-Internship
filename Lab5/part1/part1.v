module part1 (
    parameter n = 5,    
    parameter k = 20   //we need to count till 19 so 5 bits are enough   
)(
    input wire clock,    
    input wire reset_n,    
    output reg rollover,  
    output reg [n-1:0] Q, 
    output wire [n-1:0] LEDR, 
    output wire LEDR0      
);

always @(posedge clock or negedge reset_n) begin
    if (!reset_n) begin
        Q <= {n{1'b0}};
        rollover <= 1'b0;
    end 
    else if (Q == k-1) begin
        Q <= {n{1'b0}};  //replication operator 
        rollover <= 1'b1;
    end 
    else begin
        Q <= Q + 1'b1;
        rollover <= 1'b0;
    end
end

assign LEDR = Q;
assign LEDR0 = rollover;

endmodule

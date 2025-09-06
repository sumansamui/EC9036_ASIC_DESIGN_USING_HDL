// 8-bit synchronous input register (used for A and B)

module reg8_ld (
    input        clk,
    input        reset,          // active-high synchronous reset
    input  [7:0] d,       
    input ld,
    output reg [7:0] q
);
    always @(posedge clk or posedge reset) begin
        if (reset) q <= 8'd0;    // clear on reset
        
        else if (ld)    q <= d;       // capture input each clock
    end
endmodule

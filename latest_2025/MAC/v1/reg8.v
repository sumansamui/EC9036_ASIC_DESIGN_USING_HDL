// 8-bit synchronous input register (used for A and B)

module reg8 (
    input        clk,
    input        reset,          // active-high synchronous reset
    input  [7:0] d,
    output reg [7:0] q
);
    always @(posedge clk or posedge reset) begin
        if (reset) q <= 8'd0;    // clear on reset
        else       q <= d;       // capture input each clock
    end
endmodule

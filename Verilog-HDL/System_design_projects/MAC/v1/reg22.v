// 22-bit accumulator register (ACC) with synchronous reset
module reg22 (
    input         clk,
    input         reset,         // active-high synchronous reset
    input  [21:0] d,
    output reg [21:0] q          // ACC
);
    always @(posedge clk or posedge reset) begin
        if (reset) q <= 22'd0;   // clear ACC when reset=1
        else       q <= d;       // load next value otherwise
    end
endmodule

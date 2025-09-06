
module top_mac (
    input         clk,
    input         rst,         // synchronous reset
    input  [7:0]  a,
    input  [7:0]  b,
    output [21:0] y              // current ACC
);
    // Input registers improve timing (reg → comb → reg)
    wire [7:0]  a_out;
    wire [7:0]  b_out;

    // Datapath signals (all 22-bit after multiplier)
    wire [21:0] prod;          // 22-bit product (zero-extended)
    wire [21:0] acc;             // accumulator contents
    wire [21:0] sum;           // next ACC = ACC + prod22

    // Capture inputs
    reg8 reg_a (.clk(clk), .reset(rst), .d(a), .q(a_out));
    reg8 reg_b (.clk(clk), .reset(rst), .d(b), .q(b_out));

    // Multiply (8x8 -> 22)
    multiplier mult_1 (.a(a_out), .b(b_out), .p(prod));

    // Add (22 + 22 -> 22, carry-out discarded → wrap-around arithmetic)
    adder add_1 (.x(acc), .y(prod), .s(sum));

    // Accumulator register
    reg22 reg_acc (.clk(clk), .reset(rst), .d(sum), .q(acc));

    // Output mirrors ACC
    assign y = acc;
endmodule

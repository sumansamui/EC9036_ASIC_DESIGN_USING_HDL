// =====================================
// MAC datapath (structural, with cmp50)
// =====================================
module datapath (
    input        clk,
    input        reset,       // reset for regs/counter

    // Control from FSM
    input        ld_a,        // load A
    input        ld_b,        // load B
    input        ld_acc,      // load ACC (ACC <- ACC + prod)
    input        ld_out,      // OUT <- ACC
    input        count_en,    // counter enable (one per MAC)
    input        ld_count,    // counter clear pulse (e.g., in S2)

    // Data inputs
    input  [7:0]  a_in,
    input  [7:0]  b_in,

    // Status / outputs
    output [21:0] acc_q,       // latched result
    output [21:0] out_q,
    output [7:0]  count_q,     // current count
    output [7:0]  count_last,
    output        tc           // asserted when count == 50
);

    // ------------------------------
    // Local wires
    // ------------------------------
    wire [7:0]   a_q, b_q;
    wire [21:0]  prod;
    wire [21:0]  sum;

    // ------------------------------
    // Input registers
    // ------------------------------
    reg8_ld u_reg_a (
        .clk   (clk),
        .reset (reset),
        .d     (a_in),
        .ld    (ld_a),
        .q     (a_q)
    );

    reg8_ld u_reg_b (
        .clk   (clk),
        .reset (reset),
        .d     (b_in),
        .ld    (ld_b),
        .q     (b_q)
    );

    // ------------------------------
    // Multiplier: prod = A * B
    // ------------------------------
    multiplier u_mult (
        .a (a_q),
        .b (b_q),
        .p (prod)
    );

    // ------------------------------
    // Adder: sum = ACC + prod
    // ------------------------------
    adder u_add (
        .x (acc_q),
        .y (prod),
        .s (sum)
    );

    // ------------------------------
    // ACC register (loads 'sum' when ld_acc=1)
    // ------------------------------
    reg22_ld u_acc (
        .clk   (clk),
        .reset (reset),
        .d     (sum),
        .ld    (ld_acc),
        .q     (acc_q)
    );

    // ------------------------------
    // OUT register (captures ACC when ld_out=1)
    // ------------------------------
    reg22_ld u_out (
        .clk   (clk),
        .reset (reset),
        .d     (acc_q),
        .ld    (ld_out),
        .q     (out_q)
    );

    // ------------------------------
    // 8-bit counter (enable + clear)
    // ld_count is used as a synchronous clear via rst OR
    // ------------------------------
    counter_en u_cnt (
        .clk   (clk),
        .rst   (reset),
        .en    (count_en),
        .count (count_q)
    );
    
    reg8_ld u_reg_cnt (
        .clk   (clk),
        .reset (reset),
        .d     (count_q),
        .ld    (ld_count),
        .q     (count_last)
    );

    // ------------------------------
    // Your comparator50: tc=1 when count==50
    // ------------------------------
    comparator50 u_cmp50 (
        .d  (count_q),   // 6-bit input
        .tc (tc)         // terminal count
    );

endmodule

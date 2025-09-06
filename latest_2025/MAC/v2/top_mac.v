module top_mac (
    input  wire        clk,
    input  wire        reset,        // synchronous reset
    input  wire        go,           // start
    input  wire        stop,         // external stop (level)
    input  wire [7:0]  a_in,         // operand A
    input  wire [7:0]  b_in,         // operand B
    
    output wire        idle,
    output wire        busy,
    output wire        done,         // 1-cycle pulse at end (from controller S2)
    output wire [21:0] out_result,   // latched final ACC (from datapath OUT reg)
    output wire [21:0] out_acc, 
    output wire [7:0]  count_value,   // current MAC count (from datapath counter)
    output wire [8:0]  count_last
);

    // -----------------------------
    // Control interconnects
    // -----------------------------
    wire ld_a, ld_b, ld_acc, count_en;
    wire ld_out, ld_count;
    wire tc;   // terminal count from datapath (count==50 or as per your comparator)


    datapath dp_mac (
        .clk       (clk),
        .reset     (reset),

        .ld_a      (ld_a),
        .ld_b      (ld_b),
        .ld_acc    (ld_acc),
        .ld_out    (ld_out),
        .count_en  (count_en),
        .ld_count  (ld_count),

        .a_in      (a_in),
        .b_in      (b_in),

        .acc_q     (out_acc),
        .out_q     (out_result),
        .count_q   (count_value),
        .tc        (tc),
        .count_last(count_last)
    );


    controller cont_mac (
        .clk       (clk),
        .rst       (reset),

        .go        (go),
        .stop      (stop),
        .tc        (tc),

        .ld_a      (ld_a),
        .ld_b      (ld_b),
        .ld_acc    (ld_acc),
        .count_en  (count_en),
        .idle (idle),
        .busy (busy),
        .done      (done),
        .ld_out    (ld_out),
        .ld_count  (ld_count)
    );

endmodule

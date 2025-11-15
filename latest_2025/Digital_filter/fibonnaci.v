//=====================================================
// Fibonacci Generator with Separate Combinational Logic
//=====================================================

module fibonacci_comb_seq (
    input  wire       clk,
    input  wire       rst,        // synchronous reset
    output reg [15:0] fib_out     // current Fibonacci number
);

    reg [15:0] a, b;       // registers for previous two numbers
    reg [15:0] next_fib;   // combinational result

    // ---------- Combinational Block ----------
    always @(*) begin
        next_fib = a + b;  // compute next number
    end

    // ---------- Sequential Block ----------
    always @(posedge clk) begin
        if (rst) begin
            a <= 0;
            b <= 1;
            fib_out <= 0;
        end else begin
            fib_out <= next_fib;  // output current Fibonacci number
            a <= b;               // shift registers
            b <= next_fib;        // update latest value
        end
    end
endmodule

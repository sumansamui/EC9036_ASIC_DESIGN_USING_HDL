module Fibonacci_Generator (
    input clk,           // Clock signal
    input reset,         // Reset signal
    output reg [31:0] fib,  // Output for Fibonacci number
    output reg done        // Signal to indicate completion
);

    reg [31:0] a, b;   // Registers to hold Fibonacci sequence values
    reg [4:0] count;   // Counter to limit the sequence to 30 numbers

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            a <= 32'd0;     // Initialize first Fibonacci number
            b <= 32'd1;     // Initialize second Fibonacci number
            fib <= 32'd0;   // Start with the first Fibonacci number
            count <= 5'd0;  // Counter reset to 0
            done <= 1'b0;   // Indicate that sequence generation is not done
        end else begin
            if (count < 5'd30) begin
                fib <= a;       // Output current Fibonacci number
                a <= b;         // Move `b` to `a` for the next iteration
                b <= a + b;     // Compute next Fibonacci number
                count <= count + 1;  // Increment count
            end else begin
                done <= 1'b1;   // Indicate sequence completion
            end
        end
    end
endmodule

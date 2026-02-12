module GCD (
    input wire clk,          // Clock signal
    input wire reset,        // Reset signal
    input wire start,        // Start signal to begin the GCD computation
    input wire [31:0] a,     // First input number
    input wire [31:0] b,     // Second input number
    output reg [31:0] gcd,   // Output result (GCD of a and b)
    output reg done          // Done signal, goes high when GCD is computed
);

    reg [31:0] x, y;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            gcd <= 0;
            done <= 0;
        end
        else if (start) begin
            // Initialize x and y with input values
            x = a;
            y = b;

            // Non-synthesizable while loop to calculate GCD
            while (x != y) begin
                if (x > y)
                    x = x - y;
                else
                    y = y - x;
            end

            // Once the loop is complete, set the GCD and done signals
            gcd <= x;
            done <= 1;
        end
    end
endmodule



module AddTenNumbers (
    input wire [15:0] num_in [0:9], // Input array of 10 numbers
    output reg [31:0] sum           // Output sum (32-bit to handle larger sums)
);

    integer i; // Loop counter

    initial begin
        // Initialize sum to zero
        sum = 0;

        // Non-synthesizable procedural block for adding numbers
        for (i = 0; i < 10; i = i + 1) begin
            sum = sum + num_in[i]; // Add each number to the sum
        end

        // Optionally display the result (for simulation purposes)
        $display("Sum of the numbers: %d", sum);
    end
endmodule

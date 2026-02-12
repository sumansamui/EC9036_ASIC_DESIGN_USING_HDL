module FSM (
    input wire clk,           // Clock signal
    input wire reset,         // Reset signal
    input wire a,             // Input 'a' for XOR operation in S2
    input wire b,             // Input 'b' for XOR operation in S2
    output reg out            // Output signal based on state
);

    // State encoding
    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;

    reg [1:0] current_state, next_state; // State registers
    reg [3:0] counter;                   // 4-bit counter for timing

    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= S0;           // Start from S0 on reset
        end else begin
            current_state <= next_state;   // Move to next state
        end
    end

    // Counter logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;                  // Reset counter on global reset
        end else if (current_state != next_state) begin
            counter <= 0;                  // Reset counter on state transition
        end else if (current_state != S0) begin
            counter <= counter + 1;        // Increment counter in S1, S2, S3
        end else begin
            counter <= 0;                  // Keep counter zero in S0
        end
    end

    // Next state determination logic
    always @(current_state,go,counter) begin
        case (current_state)
            S0: begin
                next_state = S1;               // Move from S0 to S1 immediately
            end
            S1: begin
                if (counter >= 2) begin
                    next_state = S2;           // Move to S2 after 2 seconds in S1
                end else begin
                    next_state = S1;           // Stay in S1 until 2 seconds
                end
            end
            S2: begin
                if (counter >= 4) begin
                    next_state = S3;           // Move to S3 after 4 seconds in S2
                end else begin
                    next_state = S2;           // Stay in S2 until 4 seconds
                end
            end
            S3: begin
                if (counter >= 6) begin
                    next_state = S0;           // Return to S0 after 6 seconds in S3
                end else begin
                    next_state = S3;           // Stay in S3 until 6 seconds
                end
            end
            default: begin
                next_state = S0;               // Default state
            end
        endcase
    end

    // Output logic based on the current state
    always @(*) begin
        case (current_state)
            S0: out = 0;                       // Output is 0 in S0
            S1: out = 1;                       // Output is 1 in S1
            S2: out = a ^ b;                   // Output is a XOR b in S2
            S3: out = 1;                       // Output is 1 in S3
            default: out = 0;
        endcase
    end
endmodule

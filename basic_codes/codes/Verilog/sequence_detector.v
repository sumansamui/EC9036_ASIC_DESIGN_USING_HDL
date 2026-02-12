module sequence_detector_11(
    input clk,         // Clock signal
    input rst,         // Reset signal
    input din,         // Data input
    output reg dout    // Sequence detected output
);

    // State encoding
    parameter IDLE = 2'b00;
    parameter S1   = 2'b01; // State after detecting '1'
    parameter S11  = 2'b10; // State after detecting '11'

    reg [1:0] state, next_state;

    // State transition logic (sequential logic)
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state logic (combinational logic)
    always @(state) begin
        next_state = state; // Default state remains the same
        case (state)
            IDLE: begin
                if (din)
                    next_state = S1;   // Transition to S1 when '1' is detected
                else
                    next_state = IDLE; // Remain in IDLE if '0' is detected
            end
            S1: begin
                if (din)
                    next_state = S11;  // Transition to S11 when '11' is detected
                else
                    next_state = IDLE; // Reset to IDLE if '0' is detected
            end

            S11: begin
                if (din)
                    next_state = S11;  // Stay in S11 for overlapping '11'
                else
                    next_state = IDLE; // Reset to IDLE if '0' is detected
            end

            default: next_state = IDLE;
        endcase
    end

    // Output logic (combinational logic)
    always @(state) begin
        case (state)
            S11: dout = 1; // Set dout to 1 when in state S11 (sequence '11' detected)
            default: dout = 0;
        endcase
    end
endmodule

module sequence_detector_11(
    input clk,         // Clock signal
    input rst,         // Reset signal
    input din,         // Data input
    output reg dout    // Sequence detected output
);

    // State encoding
    parameter IDLE = 2'b00;
    parameter S1   = 2'b01; // State after detecting '1'
    parameter S11  = 2'b10; // State after detecting '11'

    reg [1:0] state, next_state;

    // State transition logic (sequential logic)
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= IDLE;
        else
            state <= next_state;
    end

// Combinational logic for next state using case statement
    always @(state,x) begin
        case (state)
            IDLE: next_state = din ? S1 : IDLE; // From IDLE
            S1:   next_state = din ? S11 : IDLE; // From S1
            S11:   next_state = din ? S11 : IDLE; // From S2
            default: next_state = IDLE; // Default case
        endcase
    end

    // Output logic using ternary operator
    always @(state) begin
        dout = (state == S11) ? 1 : 0; // Set dout based on state
    end
endmodule
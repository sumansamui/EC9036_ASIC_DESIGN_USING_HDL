module odd_ones_sequence_detector (
    input wire clk,
    input wire reset,
    input wire in,
    output reg out
);

    // State encoding
    parameter RESET = 2'b00, EVEN = 2'b01, ODD = 2'b10;
    reg [1:0] state, next_state;

    // State transition logic with reset
    always @(posedge clk) begin
        if (reset) begin
            state <= RESET; // Transition to RESET state on reset
        end else begin
            state <= next_state;
        end
    end

    // Next state logic
    always @(*) begin
        case (state)
            RESET: next_state = (in) ? ODD : RESET; // Move to ODD if in=1, stay in RESET if in=0
            EVEN: next_state = (in) ? ODD : EVEN;   // Move to ODD on '1'
            ODD: next_state = (in) ? EVEN : ODD;    // Move to EVEN on '1'
            default: next_state = RESET;            // Default to RESET state
        endcase
    end

    // Output logic
    always @(*) begin
        out = (state == ODD) ? 1'b1 : 1'b0; // Output 1 in ODD state only
    end

endmodule

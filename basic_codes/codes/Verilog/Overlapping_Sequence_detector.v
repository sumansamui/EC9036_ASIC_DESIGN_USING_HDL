module Overlapping_Sequence_Detector (
    input wire clk,            // Clock signal
    input wire reset,          // Reset signal
    input wire in,             // Input bit stream
    output reg detected        // Output, goes high when "101" or "110" is detected
);

    // State encoding using parameter
    parameter IDLE = 2'b00;
    parameter S1   = 2'b01;
    parameter S10  = 2'b10;
    parameter S11  = 2'b11;

    reg [1:0] current_state, next_state;

    // State transition logic (sequential always block)
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // Next state logic (combinational always block)
    always @(current_state,in) begin
        case (current_state)
            IDLE: begin
                if (in == 1)
                    next_state = S1;
                else
                    next_state = IDLE;
            end
            
            S1: begin
                if (in == 0)
                    next_state = S10;
                else
                    next_state = S11;
            end
            
            S10: begin
                if (in == 1)
                    next_state = S1;     // "101" detected, go to S1 for overlapping detection
                else
                    next_state = IDLE;
            end
            
            S11: begin
                if (in == 0)
                    next_state = S10;    // "110" detected, go to S10 for overlapping detection
                else
                    next_state = S11;
            end
            
            default: next_state = IDLE;
        endcase
    end

    // Output logic (combinational always block)
    always @(current_state,in) begin
       
        case (current_state)
            S10: begin
                if (in == 1)
                    detected = 1'b1;  // "101" detected 
                else    
                	detected = 1'b0;
            end
            
            S11: begin
                if (in == 0)
                    detected = 1'b1;  // "110" detected
                else
                	detected = 1'b0;
            end
            default: detected = 1'b0;
        endcase
    end
endmodule

//=====================================================
// 4-Stage Shift Register Chain
//=====================================================

module shift_reg_chain #(
    parameter WIDTH = 8    // bit width per register
)(
    input  wire             clk,
    input  wire             rst,       // synchronous reset
    input  wire [WIDTH-1:0] data_in,   // input data
    output wire [WIDTH-1:0] data_out   // output (last register)
);
    // Four registers in series
    reg [WIDTH-1:0] r0, r1, r2, r3;

    always @(posedge clk) begin
        if (rst) begin
            r0 <= {WIDTH{1'b0}};
            r1 <= {WIDTH{1'b0}};
            r2 <= {WIDTH{1'b0}};
            r3 <= {WIDTH{1'b0}};
        end else begin
            r0 <= data_in;  // new input enters first stage
            r1 <= r0;       // shift to next
            r2 <= r1;
            r3 <= r2;
        end
    end

    assign data_out = r3;   // final output
endmodule

module comparator50 (
    input  wire [7:0] d,        // 8-bit input
    output reg        tc  // 1 if d == 0
);

    always @(*) begin
        if (d == 8'd49)
            tc = 1'b1;   // all bits zero
        else
            tc = 1'b0;   // at least one bit is 1
    end

endmodule

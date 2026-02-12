`timescale 1ns / 1ps

module data_validity_checker (
    input  wire [7:0] a,
    input  wire [7:0] b,
    output reg        flag
);
    always @(*) begin
        if (a == 8'd0 || b == 8'd0)
            flag = 1'b1;
        else
            flag = 1'b0;
    end
endmodule


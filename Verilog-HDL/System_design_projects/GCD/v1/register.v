`timescale 1ns / 1ps

module register(clk,rst,data_in,ld,out);
input clk,rst;
input [7:0] data_in;
input ld;
output reg [7:0] out;
always @(posedge clk or posedge rst)
begin
if (rst==1'b1)
out<=1'b0;
else if (ld==1'b1)
out<=data_in;
end
endmodule

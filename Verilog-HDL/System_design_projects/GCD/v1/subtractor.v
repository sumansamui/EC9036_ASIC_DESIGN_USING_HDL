`timescale 1ns / 1ps
module subtractor(in1,in2,out);
input [7:0] in1,in2;
output reg [7:0] out;
always @(in1 or in2)
begin
out=in1-in2;
end
endmodule

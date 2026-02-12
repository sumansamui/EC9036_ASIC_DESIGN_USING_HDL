`timescale 1ns / 1ps

module mux(out,sel,in0,in1);
output reg [7:0] out;
input [7:0] in0,in1;
input sel;
always @(sel or in0 or in1)
begin
if (sel==1'b0)
out=in0;
else
out=in1;
end
endmodule

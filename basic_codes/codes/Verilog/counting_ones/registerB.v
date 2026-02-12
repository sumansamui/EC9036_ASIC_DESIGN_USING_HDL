`timescale 1ns / 1ps
module registerB(reset,count_enable,clk,q);
input reset;
input count_enable; 
input clk;
output reg [3:0] q;
always @(posedge clk or posedge reset)
begin
if (reset==1'b1)
q<=4'b0000;
else if (count_enable==1'b1)
q<=q+1;
end
endmodule

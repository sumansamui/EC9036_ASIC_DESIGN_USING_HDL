`timescale 1ns / 1ps
module registerA(data_in,load,sr,clk,count_enable,z);
input [7:0] data_in;
input load;
input sr;
input clk;
output reg count_enable;
reg [7:0] q;
output reg z;
always @(posedge clk)
begin
if (load)
q<=data_in;
else if (sr) begin
count_enable = q[0];
q<= {1'b0,q[7:1]}; end
end
always @(posedge clk)begin
if (q==8'b0)
z=1'b1;
else
z=1'b0;
end
endmodule
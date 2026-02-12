`timescale 1ns / 1ps
module testbench;
reg [7:0] data_in;
reg clk;
wire [3:0] q;
reg start;

top t1(data_in,clk,start,q);

initial begin
clk=1'b0; start=1'b0;data_in=8'd12;
#15; start=1'b1; data_in=8'd21;
data_in=8'b11001100;
#100; data_in=8'b01101110;
#500 ; start=1'b0; 
end
always #10 clk=~clk;
endmodule

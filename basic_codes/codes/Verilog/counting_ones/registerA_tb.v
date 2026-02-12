`timescale 1ns / 1ps
module registerA_tb;

reg [7:0] data_in;
reg load;
reg sr;
reg clk;
wire count_enable;
wire [7:0] q;
wire z;
registerA r1(data_in,load,sr,clk,count_enable,z,q);

initial begin
clk=1'b0; load=1'b1; data_in=8'b10110110;sr=1'b0;

#50 load=1'b0;sr=1'b1;

#50 sr=1'b1;

#50 sr=1'b1;

#50 sr=1'b1;

#50 sr=1'b1;

#50 sr=1'b1;

#50 sr=1'b1;

#50 sr=1'b1;

#50 sr=1'b1;

#50 sr=1'b1;
end 

always #20 clk=~clk;
endmodule

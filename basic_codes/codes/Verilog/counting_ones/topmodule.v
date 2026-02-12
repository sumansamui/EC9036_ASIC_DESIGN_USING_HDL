`timescale 1ns / 1ps
module topmodule(data_in,clk);
input data_in;
input clk;
output q;

registerA r1(data_in,load,sr,clk,count_enable,z);
registerB r2(reset,count_enable,clk,q);

endmodule

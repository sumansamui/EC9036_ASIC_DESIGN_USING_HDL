`timescale 1ns / 1ps

module top(data_in,clk,start,q);
input [7:0] data_in;
input clk;
input start;
output [3:0] q;
wire load;
wire sr;
wire count_enable;
wire z;
wire reset;
registerA r1(data_in,load,sr,clk,count_enable,z);
registerB r2(reset,count_enable,clk,q);
controller c1(go,clk,z,start,sr,load,reset);
endmodule

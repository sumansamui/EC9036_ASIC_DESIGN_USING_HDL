`timescale 1ns/1ps
module top_design(clk,rst,go,data_in1,data_in2,out,done,ps,ns,output_en);
input clk,rst,go;
input [7:0] data_in1,data_in2;
output [7:0] out;
output done,output_en;
output [3:0] ps,ns;
wire a_gt_b,a_eq_b,a_lt_b; // input to the controller from datapath
wire a_ld,a_sel,b_ld,b_sel; // output from controller to datapath
wire output_en;

// instantiate datapath and controller

controller c1(clk,rst,go,a_gt_b,a_eq_b,a_lt_b,a_ld,b_ld,a_sel,b_sel,output_en,done,ps,ns);
datapath d1(clk,rst,data_in1,data_in2,a_sel,b_sel,a_ld,b_ld,a_gt_b,a_eq_b,a_lt_b,output_en,out);

endmodule 
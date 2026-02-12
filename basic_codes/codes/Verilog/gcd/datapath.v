`timescale 1ns/1ps
module datapath(clk,rst,data_in1,data_in2,a_sel,b_sel,a_ld,b_ld,a_gt_b,a_eq_b,a_lt_b,output_en,out);
input [7:0] data_in1,data_in2;
input clk,rst;
input a_sel,b_sel,a_ld,b_ld;                              
output a_gt_b,a_eq_b,a_lt_b;
input output_en;
output [7:0] out;
wire [7:0] tain,tbin,taout,tbout,t1,t2;
subtractor s1(taout,tbout,t1);
subtractor s2(tbout,taout,t2);  
mux m1(tain,a_sel,t1,data_in1);
mux m2(tbin,b_sel,t2,data_in2);
register r1(clk,rst,tain,a_ld,taout);
register r2(clk,rst,tbin,b_ld,tbout);
register rout(clk,rst,taout,output_en,out);
comparator c1(taout,tbout,a_gt_b,a_eq_b,a_lt_b);
endmodule
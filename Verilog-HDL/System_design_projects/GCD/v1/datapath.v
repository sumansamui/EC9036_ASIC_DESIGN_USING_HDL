`timescale 1ns/1ps
module datapath(clk,rst,data_in1,data_in2,a_sel,b_sel,a_ld,b_ld,a_gt_b,a_eq_b,a_lt_b,out,ld_out,out);
input [7:0] data_in1,data_in2;
input clk,rst;
input m1_sel,m2_sel,m3_sel,m4_sel,a_ld,b_ld,ld_out;                              
output a_gt_b,a_eq_b,a_lt_b,flag;
output [7:0] out;
wire [7:0] tain,tbin,taout,tbout,sub_out;
subtractor s1(taout,tbout,sub_out); 
mux m1(tain,m1_sel,sub_out,data_in1);
mux m2(tbin,m2_sel,sub_out,data_in2);  
mux m3(sub_in1,sel_m3,taout,data_in1);
mux m4(sub_in2,sel_m4,tbout,data_in2);
register r1(clk,rst,tain,a_ld,taout);
register r2(clk,rst,tbin,b_ld,tbout);
register rout(clk,rst,taout,ld_out,out);
comparator c1(taout,tbout,a_gt_b,a_eq_b,a_lt_b);      
data_validity_checker(data_in1,data_in2,flag);

endmodule
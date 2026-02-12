`timescale 1ns/1ps
module controller(clk,rst,go,a_gt_b,a_eq_b,a_lt_b,a_ld,b_ld,a_sel,b_sel,output_en,done,ps);
input clk,rst;
input go; 
input a_gt_b,a_eq_b,a_lt_b; 
output reg a_sel,b_sel,a_ld,b_ld,done,output_en;
output reg [3:0] ps;
reg [2:0] ns;
parameter s0=3'd0;
parameter s1=3'd1;
parameter s2=3'd2;
parameter s3=3'd3;
parameter s4=3'd4;
parameter s5=3'd5;
parameter s6=3'd6;
parameter s7=3'd7;
//parameter s8=4'd8;
// modelling the state register

always @(posedge clk or posedge rst)
begin
if (rst==1'b1)
ps<=s0;
else
ps<=ns;
end

//Next state logic (combinational)

always @(go or a_gt_b or a_lt_b or a_eq_b or ps)
begin
case(ps)
s0: begin
if (go==1'b1)
ns=s1;
else
ns=s0;
end
s1:ns=s2;
s2:ns=s3;
s3:begin
if(a_gt_b==1'b1)
ns=s4;
else if (a_lt_b==1'b1)
ns=s5;
else
ns=s7;
end
s4:ns=s6;
s5:ns=s6;
s6:ns=s3;
s7:ns=s0;
default:ns=s0;
endcase
end

// output logic (combinational)
always @(ps)
begin
case(ps)
s0:begin
a_sel=1'b0;
b_sel=1'b0;
a_ld=1'b0;
b_ld=1'b0;
done=1'b0;
output_en=1'b0;
end
s1:begin
a_sel=1'b1;
b_sel=1'b1;
a_ld=1'b1;
b_ld=1'b1;
done=1'b0;
output_en=1'b0;
end
s2:begin
a_sel=1'b0;
b_sel=1'b0;
a_ld=1'b0;
b_ld=1'b0;
done=1'b0;
output_en=1'b0;
end
s4:begin
a_sel=1'b0;
b_sel=1'b0;
a_ld=1'b1;
b_ld=1'b0;
done=1'b0;
output_en=1'b0;
end
s5:begin
a_sel=1'b0;
b_sel=1'b0;
a_ld=1'b0;
b_ld=1'b1;
done=1'b0;
output_en=1'b0;
end
s6:begin
a_sel=1'b0;
b_sel=1'b0;
a_ld=1'b0;
b_ld=1'b0;
done=1'b0;
output_en=1'b0;
end
s7:begin
a_sel=1'b0;
b_sel=1'b0;
a_ld=1'b0;
b_ld=1'b0;
done=1'b1;
output_en=1'b1;
end
default:begin
a_sel=1'b0;
b_sel=1'b0;
a_ld=1'b0;
b_ld=1'b0;
done=1'b0;
output_en=1'b0;
end
endcase
end
endmodule
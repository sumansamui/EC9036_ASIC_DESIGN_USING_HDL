`timescale 1ns/1ps
module controller(clk,rst,go,a_gt_b,a_eq_b,a_lt_b,flag,ld_a,ld_b,sel_m1,sel_m2,sel_m3,sel_m4,ld_out,idle,invalid,busy,done,ps);
input clk,rst;
input go; 
input a_gt_b,a_eq_b,a_lt_b; 
output reg a_sel,b_sel,a_ld,b_ld,done,ld_out,idle,invalid,busy,done;
output reg [3:0] ps;
reg [2:0] ns;
parameter s0=4'd0;
parameter s1=4'd1;
parameter s2=4'd2;
parameter s3=4'd3;
parameter s4=4'd4;
parameter s5=4'd5;
parameter s6=4'd6;
parameter s7=4'd7;  
parameter s8=4'd8;
parameter s9=4'd9;
parameter s10=4'd10;
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

always @(go or a_gt_b or a_lt_b or a_eq_b or flag or ps)
begin
case(ps)
s0: begin
if (flag==1'b1)
ns=s1;
else
ns=s2;
end
s1:begin
if (flag==1'b0)
ns=s2;
else
ns=s1;
end
s2:begin
if (go==1'b1)
ns=s3;
else
ns=s2;
end 
s3:ns=s4;
s4:begin
if(a_gt_b==1'b1)
ns=s5;
else if (a_lt_b==1'b1)
ns=s7;
else
ns=s9;
end
s5:ns=s6;
s6:ns=s4;
s7:ns=s8;
s8:ns=s4;
s9:ns=s10;
s10:ns=s0;
default:ns=s0;
endcase
end

// output logic (combinational)
always @(ps)
begin
case(ps)
s0:begin
ld_a=1'b0;
ld_b=1'b0; 
ld_out=1'b0;
sel_m1=1'b0;
sel_m2=1'b0;
sel_m3=1'b0;
sel_m4=1'b0;
idle=1'b0;
invalid=1'b0;
busy=1'b0;
done=1'b0;
end
s1:begin
ld_a=1'b0;
ld_b=1'b0; 
ld_out=1'b0;
sel_m1=1'b0;
sel_m2=1'b0;
sel_m3=1'b0;
sel_m4=1'b0;
idle=1'b1;
invalid=1'b1;
busy=1'b0;
done=1'b0;
end
s2:begin
ld_a=1'b0;
ld_b=1'b0; 
ld_out=1'b0;
sel_m1=1'b0;
sel_m2=1'b0;
sel_m3=1'b0;
sel_m4=1'b0;
idle=1'b1;
invalid=1'b0;
busy=1'b0;
done=1'b0;
end
s3:begin
ld_a=1'b1;
ld_b=1'b1; 
ld_out=1'b0;
sel_m1=1'b1;
sel_m2=1'b1;
sel_m3=1'b0;
sel_m4=1'b0;
idle=1'b0;
invalid=1'b0;
busy=1'b1;
done=1'b0;
end
s4:begin
ld_a=1'b0;
ld_b=1'b0; 
ld_out=1'b0;
sel_m1=1'b0;
sel_m2=1'b0;
sel_m3=1'b0;
sel_m4=1'b0;
idle=1'b0;
invalid=1'b0;
busy=1'b1;
done=1'b0;
end
s5:begin
ld_a=1'b1;
ld_b=1'b0; 
ld_out=1'b0;
sel_m1=1'b0;
sel_m2=1'b0;
sel_m3=1'b0;
sel_m4=1'b1;
idle=1'b0;
invalid=1'b0;
busy=1'b1;
done=1'b0;  
end
s6:begin
ld_a=1'b0;
ld_b=1'b0; 
ld_out=1'b0;
sel_m1=1'b0;
sel_m2=1'b0;
sel_m3=1'b0;
sel_m4=1'b0;
idle=1'b0;
invalid=1'b0;
busy=1'b1;
done=1'b0;  
end 
s7:begin
ld_a=1'b0;
ld_b=1'b1; 
ld_out=1'b0;
sel_m1=1'b0;
sel_m2=1'b0;
sel_m3=1'b1;
sel_m4=1'b0;
idle=1'b0;
invalid=1'b0;
busy=1'b1;
done=1'b0;  
end      
s8:begin
ld_a=1'b0;
ld_b=1'b0; 
ld_out=1'b0;
sel_m1=1'b0;
sel_m2=1'b0;
sel_m3=1'b0;
sel_m4=1'b0;
idle=1'b0;
invalid=1'b0;
busy=1'b1;
done=1'b0;  
end         
s9:begin
ld_a=1'b0;
ld_b=1'b0; 
ld_out=1'b1;
sel_m1=1'b0;
sel_m2=1'b0;
sel_m3=1'b0;
sel_m4=1'b0;
idle=1'b0;
invalid=1'b0;
busy=1'b1;
done=1'b0;  
end  
s10:begin
ld_a=1'b0;
ld_b=1'b0; 
ld_out=1'b0;
sel_m1=1'b0;
sel_m2=1'b0;
sel_m3=1'b0;
sel_m4=1'b0;
idle=1'b0;
invalid=1'b0;
busy=1'b0;
done=1'b1;  
end
default:begin
ld_a=1'b0;
ld_b=1'b0; 
ld_out=1'b0;
sel_m1=1'b0;
sel_m2=1'b0;
sel_m3=1'b0;
sel_m4=1'b0;
idle=1'b0;
invalid=1'b0;
busy=1'b0;
done=1'b0;
end
endcase
end
endmodule
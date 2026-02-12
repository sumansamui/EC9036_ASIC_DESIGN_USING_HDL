`timescale 1ns / 1ps
module comparator(a,b,a_gt_b,a_eq_b,a_lt_b);
input [7:0] a,b;
output reg a_gt_b,a_eq_b,a_lt_b;
always @ (a or b)
begin
if (a>b)
{a_gt_b,a_eq_b,a_lt_b}=3'b100;
else if (a==b)
{a_gt_b,a_eq_b,a_lt_b}=3'b010;
else
{a_gt_b,a_eq_b,a_lt_b}=3'b001;
end
endmodule

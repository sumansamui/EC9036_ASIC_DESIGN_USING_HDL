// Verilog Code Structure

module logic_ckt(a,b,c)
input a,b;
output c;
wire s1,s2;
reg r1,r2;
assign s1 = blah...blah; 
assign s2 = blah...blah;
always @(a or b )begin
r1= a & b;
end
endmodule

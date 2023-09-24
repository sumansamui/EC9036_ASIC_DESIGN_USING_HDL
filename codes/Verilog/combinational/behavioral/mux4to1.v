module mux4to1(y,a,b,c,d,s);
input [3:0] a,b,c,d;
input [1:0] s;
output reg [3:0] y;
always @(a,b,c,d,s) 
begin
case(s)
2'b00: y=a;
2'b01: y=b;
2'b10: y=c;
2'b11: y=d;
default:y=4'bxxxx;
endcase;
end
endmodule
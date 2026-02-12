module mux2to1(y,a,b,s);
output reg y;
input a,b,s;
always @(a,b,s) 
begin
if (s==1'b0)
    y=a;
else if (s==1'b1)
    y=b; 
else 
    y=1'bx;       
end
endmodule
module comparator(g,e,l,a,b);
input [3:0] a,b;
output reg g,e,l;
always @ (a,b) 
begin
if (a>b)begin
    g=1'b1;e=1'b1;l=1'b1; end
else if (a==b) begin
    g=1'b0;e=1'b1;l=1'b0; end
else if (a<b) begin
    g=1'b0;e=1'b0;l=1'b1; end
else begin
    g=1'bx;e=1'bx;l=1'bx; end
end
endmodule
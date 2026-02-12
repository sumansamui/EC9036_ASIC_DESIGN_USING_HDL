// Example of a verilog code

module mux2_1(i0,i1,s,y);
input [3:0] i0,i1;
input s;
output [3:0] y;
assign y=s?i1:i0;
endmodule

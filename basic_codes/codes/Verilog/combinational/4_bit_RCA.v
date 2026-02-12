module 4bit_RCA(x, y, s, co);
input [3:0] x, y;// Two 4-bit inputs
output [3:0] s;
output co;
wire w1, w2, w3;
 // instantiating 4 1-bit full adders in Verilog
FA u1(x[0],y[0], 1'b0, s[0], w1);
FA u2(x[1],y[1], w1, s[1], w2);
FA u3(x[2],y[2], w2, s[2], w3);
FA u4(x[3],y[3], w3, s[3], co);
endmodule

`timescale 1ns / 1ps
module adder_subtractor_combined(
    input [3:0] a,
    input [3:0] b,
    input m,
    output [3:0] r,
    output cout
    );
wire q,c1,c2;
wire [3:0] s;
wire [3:0] b1;
wire [3:0] p;
wire [3:0] g=4'b0000;
xor x1(b1[3],m,b[3]);
xor x2(b1[2],m,b[2]);
xor x3(b1[1],m,b[1]);
xor x4(b1[0],m,b[0]);
rca r1(a,b1,m,s,cout);
not n1(c2,cout);
and a1(q,m,c2);
xor x5(p[3],q,s[3]);
xor x6(p[2],q,s[2]);
xor x7(p[1],q,s[1]);
xor x8(p[0],q,s[0]);
rca r2(p,g,q,r,c1);
endmodule
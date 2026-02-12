`timescale 1ns / 1ps

module rca(
    input [3:0] x,
    input [3:0] y,
    input cin,
    output [3:0] sum,
    output cout
    );
wire w1,w2,w3;
fa f1(x[0],y[0],cin,sum[0],w1);
fa f2(x[1],y[1],w1,sum[1],w2);
fa f3(x[2],y[2],w2,sum[2],w3);
fa f4(x[3],y[3],w3,sum[3],cout);
endmodule

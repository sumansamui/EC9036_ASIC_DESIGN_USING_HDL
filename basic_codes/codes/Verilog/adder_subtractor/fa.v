`timescale 1ns / 1ps
module fa(
    input a,
    input b,
    input cin,
    output sum,
    output cout
    );
wire s1,c1,c2;	 
ha m1(a,b,s1,c1);
ha m2(s1,cin,sum,c2);
or g1(cout,c1,c2);
endmodule

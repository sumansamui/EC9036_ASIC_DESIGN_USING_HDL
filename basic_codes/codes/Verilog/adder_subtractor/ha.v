`timescale 1ns / 1ps
module ha(
    input a,
    input b,
    output sum,
    output cout
    );
xor g1(sum,a,b);
and g2(cout,a,b);
endmodule

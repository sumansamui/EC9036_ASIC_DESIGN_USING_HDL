// 22-bit combinational adder (unsigned)
module adder (
    input  [21:0] x,
    input  [21:0] y,
    output [21:0] s
);
    assign s = x + y;  
endmodule
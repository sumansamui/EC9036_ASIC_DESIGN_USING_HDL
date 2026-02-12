// 8x8 -> 22-bit combinational multiplier (unsigned)

module multiplier (
    input  [7:0]   a,
    input  [7:0]   b,
    output [21:0]  p
);
    assign p = a *b;            
endmodule


// alternative version
/*module multiplier (
    input  [7:0]  a,
    input  [7:0]  b,
    output [21:0] p
);
    wire [15:0] prod16;        // true product width

    assign prod16 = a * b;     // 8x8 = 16-bit
    assign p      = {6'd0, prod16}; // extend to 22 bits
endmodule*/

// File: adder.v
module adder (
    input  [7:0] a,      // 8-bit input A
    input  [7:0] b,      // 8-bit input B
    output [8:0] sum     // 9-bit output (to hold carry)
);
    assign sum = a + b;  // simple combinational addition
endmodule
// File: tb_adder.v
`timescale 1ns/1ps
module tb_adder;

  // Declare signals to connect to DUT
  reg  [7:0] a, b;
  wire [8:0] sum;

  // Instantiate the DUT
  adder uut (
    .a(a),
    .b(b),
    .sum(sum)
  );

  // Stimulus block
  initial begin
    // Apply a few test cases
    a = 8'd5;   b = 8'd3;    #10;
 
    a = 8'd10;  b = 8'd7;    #10;

    a = 8'd100; b = 8'd55;   #10;
   
    a = 8'd255; b = 8'd1;    #10;

    // Finish simulation
    $finish;
  end
  initial 
   $monitor("t=%0t a=%0d b=%0d sum=%0d", $time, clk, rst, a, b, sum);

endmodule

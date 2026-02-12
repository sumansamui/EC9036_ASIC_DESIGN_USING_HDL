`timescale 1ns/1ps

module tb_top_mac;

  // DUT ports
  reg         clk;
  reg         rst;   
  reg  [7:0]  a;
  reg  [7:0]  b;
  wire [21:0] y;

  // Instantiate DUT
  top_mac dut (
    .clk (clk),
    .rst (rst),
    .a   (a),
    .b   (b),
    .y   (y)
  );

  // Clock generation: 20 ns period (10 ns high, 10 ns low)
  initial clk = 0;
  always #10 clk = ~clk;  

  // Stimulus
  initial begin

    // Initial values
    a   = 8'd0;
    b   = 8'd0;
    rst = 1'b0;

    // At t = 16 ns, assert reset
    #16 rst = 1'b1;
    // At t = 28 ns, deassert reset
    #12 rst = 1'b0;
    
    #5  a   = 8'd1; b   = 8'd9;
    #32 a   = 8'd2; b   = 8'd8;
    #20 a   = 8'd3; b   = 8'd7;
    #20 a   = 8'd4; b   = 8'd6;
    #20 a   = 8'd5; b   = 8'd5;
    // Run simulation for total 990 ns
    #500;
    $display("Simulation finished at time %0t", $time);
    $finish;
  end
  initial begin
    #990;
    $display("Simulation finished at time %0t", $time);
    $finish;
  end
endmodule

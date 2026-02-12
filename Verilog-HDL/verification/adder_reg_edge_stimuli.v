// File: adder_reg.v
module adder_reg (
    input        clk,
    input        rst,          // active high reset
    input  [7:0] a,
    input  [7:0] b,
    output reg [8:0] sum       // registered output
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            sum <= 9'd0;       // reset sum to 0
        else
            sum <= a + b;      // latch new sum on rising clock
    end
endmodule


// File: tb_adder_reg.v
`timescale 1ns/1ps
module tb_adder_reg;

  reg clk, rst;
  reg [7:0] a, b;
  wire [8:0] sum;

  // Instantiate DUT
  adder_reg UUT (.clk(clk), .rst(rst), .a(a), .b(b), .sum(sum));

  // Clock generation block
  initial begin
    clk = 0;
    forever #5 clk = ~clk;     // 10 ns period
  end

  // Reset block (separate)
  initial begin
    rst = 1;                   // assert reset
    #15 rst = 0;               // deassert reset after 15 ns
  end

  // Stimulus block
  initial begin
    a = 0; b = 0;
    #20;                       // wait till reset done

    // 1st input pair
    a = 8'd5;   b = 8'd3;
    #20;

    // 2nd input pair
    a = 8'd10;  b = 8'd7;
    #20;

    // 3rd input pair
    a = 8'd255; b = 8'd1;
    #20;

    #20 $finish;               // end simulation
  end

endmodule


//============= tb_adder_reg_monitor_sep.v =============
`timescale 1ns/1ps
module tb_adder_reg_monitor_sep;

  reg clk, rst;
  reg  [7:0] a, b;
  wire [8:0] sum;

  adder_reg dut (.clk(clk), .rst(rst), .a(a), .b(b), .sum(sum));

  // Clock generator
  initial clk = 0;
  always #5 clk = ~clk;   // 10 ns period

  // Reset block
  initial begin
    rst = 1'b1;
    #15 rst = 1'b0;
  end

  // Separate monitor block (independent)
  initial begin
    $monitor("t=%0t clk=%b rst=%b a=%0d b=%0d sum=%0d",
              $time, clk, rst, a, b, sum);
  end

  // Stimulus block (independent)
  integer i, j;
  initial begin
    a = 0; b = 0;
    @(negedge rst);

    // Simple nested loop of stimuli
   
     for (i = 0; i < 256; i = i + 1) begin
       for (j = 0; j < 256; j = j + 1) begin
         @(negedge clk);
         a = i[7:0];
         b = j[7:0];
       end  
     end


    #20;
    $finish;
  end

endmodule



//========= tb_adder_reg_monitor.v =========
`timescale 1ns/1ps
module tb_adder_reg_monitor;

  reg clk, rst;
  reg  [7:0] a, b;
  wire [8:0] sum;

  adder_reg dut (.clk(clk), .rst(rst), .a(a), .b(b), .sum(sum));

  // clock
  initial clk = 1'b0;
  always  #5 clk = ~clk;       // 10 ns period

  // reset (separate block)
  initial begin
    rst = 1'b1;
    #15 rst = 1'b0;
  end

  // APPLY MONITOR (one line; auto-prints on any change)
  initial
    $monitor("t=%0t  clk=%b  rst=%b  a=%0d  b=%0d  sum=%0d",
             $time,  clk,     rst,     a,     b,     sum);

  // stimulus: change inputs at negedge so they’re stable before posedge
  initial begin
    a = 0; b = 0;
    @(negedge rst);

    @(negedge clk); a = 8'd5;   b = 8'd3;
    @(negedge clk); a = 8'd10;  b = 8'd7;
    @(negedge clk); a = 8'd255; b = 8'd1;

    #20;
    $finish;
  end
endmodule
            
            
// File: tb_adder_reg_file_sync.v
`timescale 1ns/1ps
module tb_adder_reg_file_sync;

  reg clk, rst;
  reg [7:0] a, b;
  wire [8:0] sum;

  adder_reg UUT (.clk(clk), .rst(rst), .a(a), .b(b), .sum(sum));

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk;   // 10 ns period

  // Reset
  initial begin
    rst = 1;
    #15 rst = 0;          // release reset after 15 ns
  end

  // File I/O and stimulus
  integer infile, outfile, r;

  initial begin
    infile  = $fopen("input_stimulus.txt", "r");
    outfile = $fopen("output_result.txt",  "w");

    if (infile == 0 || outfile == 0) begin
      $display("ERROR: File open failed");
      $finish;
    end

    // Initialize
    a = 0; b = 0;
    #20;                     // wait till reset completes

    // Loop through input file
    while (!$feof(infile)) begin
      r = $fscanf(infile, "%d %d\n", a, b);
      if (r == 2) begin
        @(negedge clk);      // change inputs just before next rising edge
        // Values stable before posedge clk
        @(posedge clk);      // DUT samples inputs here
        #1;                  // small delay to ensure sum updated
        $fwrite(outfile, "%0d + %0d = %0d\n", a, b, sum);
      end
    end

    $fclose(infile);
    $fclose(outfile);
    #20 $finish;
  end

endmodule
            
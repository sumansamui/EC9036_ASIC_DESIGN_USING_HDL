`timescale 1ns / 1ps

module sequence_detector_mealy_tb;

	// Inputs
	reg x;
	reg clk;
	reg reset;

	// Outputs
	wire detector_out;

	// Instantiate the Unit Under Test (UUT)
	sequence_detector_mealy uut (
		.x(x), 
		.clk(clk), 
		.reset(reset), 
		.detector_out(detector_out)
	);
 initial begin
 clk = 0;
 forever #5 clk = ~clk;
 end 
 initial begin
  // Initialize Inputs
  x = 0;
  reset = 1;
  // Wait 100 ns for global reset to finish
  #30;
  reset = 0;
  #40;
  x = 1;
  #10;
  x = 0;
  #10;
  x = 1; 
  #20;
  x = 0; 
  #20;
  x = 1; 
  #20;
  x = 0;  
  // Add stimulus here

 end
      
endmodule

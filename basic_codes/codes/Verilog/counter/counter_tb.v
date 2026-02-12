`timescale 1ns / 1ps
module counter_tb;
	// Inputs
	reg clk;
	reg rst;
	// Outputs
	wire [3:0] count;

	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.clk(clk), 
		.rst(rst), 
		.count(count)
	);
	initial begin
		// Initialize Inputs
		//clk = 0;
		rst = 1;
		// Wait 100 ns for global reset to finish
		#110 rst = 0;
	end
	// always #20 clk=~clk;
   initial begin
   clk=1'b0;
   forever #20 clk=~clk; 
   #10000 $finish;	
   end 	 
endmodule


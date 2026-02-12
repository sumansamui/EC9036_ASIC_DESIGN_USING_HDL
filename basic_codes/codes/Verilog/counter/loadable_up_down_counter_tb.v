`timescale 1ns / 1ps
module loadable_up_down_counter_tb;

	// Inputs
	reg clk;
	reg rst;
	reg load;
	reg [3:0] din;
	reg dir;

	// Outputs
	wire [3:0] count;

	// Instantiate the Unit Under Test (UUT)
	loadable_up_down_counter uut (
		.clk(clk), 
		.rst(rst), 
		.load(load),
		.din(din), 
		.dir(dir), 
		.count(count)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		load = 0;
		din = 0;
		dir = 1;

		#100;
		rst = 0;
		load = 1;
		din = 4;
		dir = 0;
		          
		#100;
		rst = 0;
		load = 0;
		din = 4;
		dir = 1;
		
		#100;
		dir = 0;
	end
   always #20 clk=~clk;   
endmodule


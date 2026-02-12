`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:00:45 09/15/2022
// Design Name:   adder_subtractor_combined
// Module Name:   G:/cadlab/adder_subtractor/tb.v
// Project Name:  adder_subtractor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adder_subtractor_combined
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg m;

	// Outputs
	wire [3:0] r;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	adder_subtractor_combined uut (
		.a(a), 
		.b(b), 
		.m(m), 
		.r(r), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		a = 4'b1001;
		b = 4'b1000;
		m = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a = 4'b1010;
		b = 4'b1000;
		m = 1;
		
		#100;
		
		a = 4'b1001;
		b = 4'b1010;
		m = 1;

		
		
		#100;
		
		a = 4'b1111;
		b = 4'b1110;
		m = 0;

	end
      
endmodule


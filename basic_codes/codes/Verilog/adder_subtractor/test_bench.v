`timescale 1ns / 1ps

module test_bench;

	// Inputs
	reg [3:0] x;
	reg [3:0] y;
	reg cin;

	// Outputs
	wire [3:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	rca uut (
		.x(x), 
		.y(y), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
      x = 4'b1010;;
	  y = 4'b1000;;
	  cin =1'b0;


	  #100;
        
		// Add stimulus here
      x = 4'b1011;;
	  y = 4'b1011;;
	  cin =1'b0;; 
	  #100;
	end
      
endmodule


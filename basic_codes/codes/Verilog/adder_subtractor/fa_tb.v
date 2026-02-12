`timescale 1ns / 1ps
module fa_tb;
	// Inputs
	reg a;
	reg b;
	reg cin;
	// Outputs
	wire sum;
	wire cout;
	// Instantiate the Design Under Test (DUT)
	fa dut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
	initial begin
		// Initialize Inputs
		a = 1'b0; b = 1'b0; cin = 1'b0;
      // Add stimulus here		
		#100 a = 1'b0; b = 1'b0; cin = 1'b1;
		#100 a = 1'b0; b = 1'b1; cin = 1'b0;
		#100 a = 1'b0; b = 1'b1; cin = 1'b1;
		#100 a = 1'b1; b = 1'b0; cin = 1'b0;
		#100 a = 1'b1; b = 1'b0; cin = 1'b1;
		#100 a = 1'b1; b = 1'b1; cin = 1'b0;
		#100 a = 1'b1; b = 1'b1; cin = 1'b1;
	end
	initial begin
	$monitor($time," a=%b,b=%b,cin=%b,sum=%b,cout=%b",a,b,cin,sum,cout);
	#10000 $finish;	
	end
endmodule


`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:12:32 05/06/2021
// Design Name:   cla_subtractor
// Module Name:   /home/student/Desktop/lab7bis_skel/lab7_skel/test_cla_substractor.v
// Project Name:  lab7_skel
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cla_subtractor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_cla_substractor;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire [3:0] diff;
	wire c_out;

	// Instantiate the Unit Under Test (UUT)
	cla_subtractor uut (
		.diff(diff), 
		.c_out(c_out), 
		.a(a), 
		.b(b)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a = 9;
		b = 4;

	end
      
endmodule


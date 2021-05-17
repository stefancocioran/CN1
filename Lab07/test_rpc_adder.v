`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:25:35 05/06/2021
// Design Name:   rpc_adder
// Module Name:   /home/student/Desktop/lab7bis_skel/lab7_skel/test_rpc_adder.v
// Project Name:  lab7_skel
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rpc_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_rpc_adder;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg c_in;

	// Outputs
	wire [3:0] sum;
	wire c_out;

	// Instantiate the Unit Under Test (UUT)
	rpc_adder uut (
		.sum(sum), 
		.c_out(c_out), 
		.a(a), 
		.b(b), 
		.c_in(c_in)
	);

	 initial begin

	  // Initialize Inputs
	  a = 2;
	  b = 3;
	  c_in = 0;

	  // Wait 100 ns for global reset to finish

	  #100;
	  // Add stimulus here
	  a = 2;
	  b = 3;
	  c_in = 1;

	  #100;
	  a = 4;
	  b = 5;
	  c_in = 1;
	 end	
	
      
endmodule


`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:00:58 04/12/2021
// Design Name:   counter
// Module Name:   /home/cristina/Downloads/lab05/counter_test.v
// Project Name:  lab05
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module counter_test;

	// Inputs
	reg [15:0] contor;
	reg reset;
	reg clock;
   reg decrement;

	// Outputs
	wire [15:0] ascii_out;
	wire done;

	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.ascii_in(contor), 
		.counter(ascii_out), 
		.done(done), 
		.reset(reset), 
		.clock(clock),
      .decrement(decrement)
	);

	always@(clock)
		#5 clock <= ~clock;


	initial begin
		
		clock = 1;
		reset = 1;
		contor = "20";
		decrement = 1;
		#1;
		#10;
		reset = 0;
		#10;
	end 
endmodule

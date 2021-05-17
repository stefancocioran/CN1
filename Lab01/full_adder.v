`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:29:01 03/19/2021 
// Design Name: 
// Module Name:    full_adder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module full_adder(
    input a,
    input b,
    input cin,
    output s,
    output cout
    );
	
	wire xor_ab, and_ab, out;
		
	xor(xor_ab, a, b);
	and(and_ab, a, b);
	
	xor(s, xor_ab, cin);
	and(out, xor_ab, cin);
	or(cout, and_ab, out);
	
	
endmodule

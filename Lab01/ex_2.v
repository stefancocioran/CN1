`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:10:57 03/19/2021 
// Design Name: 
// Module Name:    ex_2 
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
module ex_2(
    input a,
    input b,
    output c
    );
	 
	 wire a_neg, b_neg, out1, out2;
	 not(a_neg, a);
	 not(b_neg, b);
	 
	 and(out1, a, b_neg);
	 and(out2, a_neg, b);
	 
	 or(c, out1, out2);
	 
endmodule

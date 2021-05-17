`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:15:23 03/19/2021 
// Design Name: 
// Module Name:    ex_3 
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
module ex_3(
    input i0,
    input i1,
    input i2,
    input i3,
    input s0,
    input s1,
    output out
    );


	wire out1, out2, out3, out4;
	wire s0_neg, s1_neg;
	
	not(s0_neg, s0);
	not(s1_neg, s1);
	
	and(out1, s0_neg, s1_neg, i0);
	and(out2, s0, s1_neg, i1);
	and(out3, s0_neg, s1, i2);
	and(out4, s0, s1, i3);
	
	or(out, out1, out2, out3, out4);
	

endmodule

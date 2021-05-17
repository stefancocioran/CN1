`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:21:52 03/19/2021 
// Design Name: 
// Module Name:    ex_4 
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
module ex_4(
    input in1,
    input in2,
    input sel1,
    input sel2,
    output out
    );
	 

	 wire out_NAND, out_AND, out_OR, out_XOR;
	 
	 nand(out_NAND, in1, in2);
	 and(out_AND, in1, in2);
	 or(out_OR, in1, in2);
	 ex_2 my_xor(in1, in2, out_XOR);
	 
	 ex_3 mux(out_NAND, out_AND, out_OR, out_XOR, sel1, sel2, out);
	 


endmodule


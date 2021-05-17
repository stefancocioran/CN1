`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:19:38 03/26/2021 
// Design Name: 
// Module Name:    dmux_struc 
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
module dmux_struc(
    input in,
	 input sel0,
	 input sel1,
    output out1,
    output out2,
    output out3,
    output out4
    );
	 
	 wire not_sel0;
	 wire not_sel1;
	 
	 not(not_sel0, sel0);
    	 not(not_sel1, sel1);
	 
	 and(out1, not_sel0, not_sel1, in);
	 and(out2, not_sel0, sel1, in);
	 and(out3, sel0, not_sel1, in);
	 and(out4, sel0, sel1, in);	 


endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:26:40 03/26/2021 
// Design Name: 
// Module Name:    dmux_proc 
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
module dmux_proc(
    input in,
    input sel0,
    input sel1,
    output reg out1,
    output reg out2,
    output reg out3,
    output reg out4
    );
	
	 always @(*)
    begin
	   out1 = (~sel0 & ~sel1 & in);
      out2 = (~sel0 & sel1 & in);
		out3 = (sel0 & ~sel1 & in);
      out4 = (sel0 & sel1 & in);
	 end
	 

endmodule

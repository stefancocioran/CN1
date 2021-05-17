`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:35:31 03/26/2021 
// Design Name: 
// Module Name:    divizor_ceas 
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
module divizor_ceas(
    input in,
    output reg out
    );
	
	initial begin
		out = 0;
	end

	always @(posedge in) begin 
		out <= ~out;
	end

endmodule

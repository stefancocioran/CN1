`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:02:11 03/26/2021 
// Design Name: 
// Module Name:    xor_proc 
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
module xor_proc(
    input a,
    input b,
    output reg out
    );
	 
	always @(*)
		begin
			case ({a, b})
				2'b00: out = 0;
				2'b01: out = 1;
            2'b10: out = 1;
            2'b11: out = 0;
            default: out = 1'bx;
        endcase
    end   

endmodule

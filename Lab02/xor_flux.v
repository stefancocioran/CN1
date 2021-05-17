`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:00:47 03/26/2021 
// Design Name: 
// Module Name:    xor_flux 
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
module xor_flux(
    input a,
    input b,
    output out
    );

    assign out = (a & ~b)|(~a & b); 

endmodule

`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Design 1
//  
// Module Name:  		half_adder_structural 
// Project Name:		Laborator 6
// Target Devices: 		Digilent Nexys 3
//////////////////////////////////////////////////////////////////////////////////

module half_adder_structural(
		output sum,
		output carry,
		input bit_A,
		input bit_B
    );
	 
	// TODO 1.1: Implementati un half-adder utiliznd descrierea la nivel structural	
	xor(sum, bit_A, bit_B);
	and(carry, bit_A, bit_B);
endmodule

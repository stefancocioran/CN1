`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Design 1
//  
// Module Name:  		half_adder_dataflow
// Project Name:		Laborator 6
// Target Devices: 	Digilent Nexys 3
//////////////////////////////////////////////////////////////////////////////////

module half_adder_dataflow(
		output sum,
		output carry,
		input bit_A,
		input bit_B
    );
	 
	// TODO 1.2: Implementati un half-adder utiliznd descrierea la nivel flux de date
	assign sum = bit_A ^ bit_B;
	assign carry = bit_A & bit_B;
	
endmodule

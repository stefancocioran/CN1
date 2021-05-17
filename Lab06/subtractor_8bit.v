`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Design 1
//  
// Module Name:  		subtractor_8bit
// Project Name:		Laborator 6
// Target Devices: 		Digilent Nexys 3
//////////////////////////////////////////////////////////////////////////////////

module subtractor_8bit(
		output carry_out,
		output [7:0] result,
		input  [7:0] A,
		input  [7:0] B,
		input carry_in
    );

	// TODO 3: Implementati un scztor pe 8 biti folosind sumatorul ripple-carry implementat
	// Conventie: result = A - B
	// Hint: Complement fata de 2
	
	wire[7:0] B_comp2;
	assign B_comp2 = ~B + 1;
	
	wire[7:0] cout;
	
	full_adder fa0 (result[0], cout[0], A[0], B_comp2[0], carry_in);
	full_adder fa1 (result[1], cout[1], A[1], B_comp2[1], cout[0]);
	full_adder fa2 (result[2], cout[2], A[2], B_comp2[2], cout[1]);
	full_adder fa3 (result[3], cout[3], A[3], B_comp2[3], cout[2]);
	full_adder fa4 (result[4], cout[4], A[4], B_comp2[4], cout[3]);
	full_adder fa5 (result[5], cout[5], A[5], B_comp2[5], cout[4]);
	full_adder fa6 (result[6], cout[6], A[6], B_comp2[6], cout[5]);
	full_adder fa7 (result[7], carry_out, A[7], B_comp2[7], cout[6]);
	
endmodule

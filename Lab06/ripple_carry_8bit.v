`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Design 1
//  
// Module Name:  		ripple_carry_8bit
// Project Name:		Laborator 6
// Target Devices: 		Digilent Nexys 3
//////////////////////////////////////////////////////////////////////////////////

module ripple_carry_8bit(
		output carry_out,
		output [7:0] sum,
		input  [7:0] A,
		input  [7:0] B,
		input carry_in
    );
	
	// TODO 2: Implementati un sumator ripple-carry pe 8 biti folosind modul full-adder implementat anterior.
	// Hint: buffer pentru transportul din rangul inferior
	wire[7:0] cout;
	
	full_adder fa0 (sum[0], cout[0], A[0], B[0], carry_in);
	full_adder fa1 (sum[1], cout[1], A[1], B[1], cout[0]);
	full_adder fa2 (sum[2], cout[2], A[2], B[2], cout[1]);
	full_adder fa3 (sum[3], cout[3], A[3], B[3], cout[2]);
	full_adder fa4 (sum[4], cout[4], A[4], B[4], cout[3]);
	full_adder fa5 (sum[5], cout[5], A[5], B[5], cout[4]);
	full_adder fa6 (sum[6], cout[6], A[6], B[6], cout[5]);
	full_adder fa7 (sum[7], carry_out, A[7], B[7], cout[6]);
	
	
endmodule


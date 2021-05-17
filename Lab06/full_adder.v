`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Design 1
//  
// Module Name:  		full_adder
// Project Name:		Laborator 6
// Target Devices: 		Digilent Nexys 3
//////////////////////////////////////////////////////////////////////////////////

module full_adder(
		output sum,
		output carry_out,
		input bit_A,
		input bit_B,
		input carry_in
    );
	
	// TODO 1.4: Implementati un full-adder folosind dou instante ale modulului half-adder creat anterior.
	wire sum_tmp;
	wire carry_out_1;
	wire carry_out_2;
	half_adder_dataflow half_adder_1(sum_tmp, carry_out_1, bit_A, bit_B);
	half_adder_structural half_adder_2 (sum, carry_out_2, sum_tmp, carry_in);
	or(carry_out, carry_out_1, carry_out_2);
	
endmodule

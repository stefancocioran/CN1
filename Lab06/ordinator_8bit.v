`timescale 1ns / 1ps

///////////////////////////////////////////////////////////////////////////////
// ACS
// Computer Design 1
//  
// Module Name:  		ordinator_8bit
// Project Name:		Laborator 6
// Target Devices: 		Digilent Nexys 3
///////////////////////////////////////////////////////////////////////////////

module ordinator_8bit(
		output reg [7:0] result,
		output reg		  ready,
		input      [7:0] in,
		input            reset,
		input            clk
);

	localparam FALSE = 2'd0,
				  TRUE  = 2'd1;

	localparam OPERATOR_ADD = 2'd0,
				  OPERATOR_SUB = 2'd1,
				  OPERATOR_EQL = 2'd2,
				  OPERATOR_ERR = 2'd3;

// ----------------------------------------------------------------------------
// TODO 4.1: Codificati starile necesare automatului.
// HINT: Pentru a va fi mai usor, porniti de la implementarea de mai jos.
// ----------------------------------------------------------------------------

	localparam STATE_INITIAL = 0;
	localparam STATE_OPERAND = 1;
	localparam STATE_OPERATOR = 2;
	localparam STATE_OPERATION = 3;
	localparam STATE_RESULT = 4;

	
// ----------------------------------------------------------------------------
// Folositi registrii de mai jos pentru a memora starile
// ----------------------------------------------------------------------------
	reg [2:0] currentState;
	reg [2:0] nextState;
 
// ----------------------------------------------------------------------------
// TODO 4.2: Definiti comportamentul iesirilor
// HINT: Verificati care este rezultatul final in functie de starea curenta
// ----------------------------------------------------------------------------


 
// ----------------------------------------------------------------------------
// TODO 4.3: Definiti mecanismul de tranzitie a starilor
// HINT: Folositi currentState si nextState
// ----------------------------------------------------------------------------



// ----------------------------------------------------------------------------
// Definiti comportamentul si modul de schimbare a starilor urmand TODO-urile
// de mai jos
// ----------------------------------------------------------------------------



// ----------------------------------------------------------------------------
// TODO 4.4: Declarati-va variabilele locale de care aveti nevoie in
// implementare
// ----------------------------------------------------------------------------
	reg [7:0] carry_out;
	reg [7:0] result;
	wire carry_in;
	reg [7:0] A;
	reg [7:0] B;
	reg [7:0] counter;


// ----------------------------------------------------------------------------
// TODO 4.5: Declarati-va modulele implementate anterior de care aveti nevoie
// in implementare.
// ----------------------------------------------------------------------------
	
	ripple_carry_8bit adder(carry_out, result, operand, A, carry_in);
	subtractor_8bit (carry_out, result, operand, B, carry_in);


	always @(*) begin
		case (currentState)
			// -------------------------------------------------------------------
			// TODO 4.6: Implementati modulul de schimbare a starilor
			// -------------------------------------------------------------------
			
			
		endcase
	end
endmodule

`timescale 1ns / 1ps
`include "lib/defines.vh"
module ex2(
	output reg [7:0]   out,
	output reg [3:0] currentState,
	input reset,
	input clk
	);

	localparam STATE_INITIAL = 0;
	localparam STATE_T00 = 1;
	localparam STATE_T01 = 2;
	localparam STATE_T02 = 3;
	localparam STATE_T03 = 4;
	localparam STATE_T04 = 5;
	localparam STATE_T05 = 6;
	localparam STATE_T06 = 7;
	localparam STATE_T07 = 8;
	localparam STATE_T08 = 9;
	localparam STATE_T09 = 10;
	localparam STATE_T10 = 11;
	localparam STATE_T11 = 12;
	localparam STATE_T12 = 13;
	localparam STATE_T13 = 14;
	localparam STATE_T14 = 15;

	//folositi count pentru a intarzia tranzitiile intre stari
	//cu o secunda
	reg [31:0]  count;
	reg [3:0] nextState;
	 
	initial begin
		currentState = 0;
	end



	always @(posedge clk) begin
		if (reset) begin
			count = 0;
			currentState = STATE_INITIAL;
		end
		//TODO: efectueaza tranzitia in starea urmatoare dupa 1s.
		//(Aveti in defines.vh o constanta SECOND pe care o puteti folosi)
		else begin
			count = count + 1;
			if (count > `SECOND) begin
				currentState = nextState;
				count = 0;
			end
		end
	end

	//Output-ul pentru fiecare dintre stari trebuie sa arate astfel:
	//t00 *-*-*-*-
	//t01 -*-*-*-*
	//t02 *-*-*-*-
	//t03 -*-*-*-*
	//t04 *------*
	//t05 -*----*-
	//t06 --*--*--
	//t07 ---**---
	//t08 --*--*--
	//t09 -*----*-
	//t10 *------*
	//t11 -**-*--*
	//t12 *---**-*
	//t13 *---*-**
	//t14 -**-*--*
	//mergi la t00


	//Legenda:	"*" din output = "LED aprins" = 1 in cod;
	//				"-" din output = "LED stins" = 0 in cod;


	always @(*) begin
		case (currentState)
			//TODO: stabiliti output-ul pentru fiecare stare
			//si legati starile intre ele prin tranzitii
			STATE_INITIAL: begin
				out = 8'b00000000;
            nextState = STATE_T00;
			end
			
			STATE_T00: begin
				out = 8'b10101010;
            nextState = STATE_T01;
			end
			
			STATE_T01: begin
				out = 8'b01010101;
				nextState = STATE_T02;
			end
			
			STATE_T02: begin
				out = 8'b10101010;
				nextState = STATE_T03;
			end
			
			STATE_T03: begin
				out = 8'b01010101;
				nextState = STATE_T04;
			end
			
			STATE_T04: begin
				out = 8'b10000001;
				nextState = STATE_T05;
			end
			
			STATE_T05: begin
				out = 8'b01000010;
				nextState = STATE_T06;
			end
			
			STATE_T06: begin
				out = 8'b00100100;
				nextState = STATE_T07;
			end
			
			STATE_T07: begin
				out = 8'b00011000;
				nextState = STATE_T08;
			end
			
			STATE_T08: begin
				out = 8'b00100100;
				nextState = STATE_T09;
			end
			
			STATE_T09: begin
				out = 8'b01000010;
				nextState = STATE_T10;
			end
			
			STATE_T10: begin
				out = 8'b10000001;
				nextState = STATE_T11;
			end
			
			STATE_T11: begin
				out = 8'b01101001;
				nextState = STATE_T12;
			end
			
			STATE_T12: begin
				out = 8'b10001101;
				nextState = STATE_T13;
			end
			
			STATE_T13: begin
				out = 8'b10001011;
				nextState = STATE_T14;
			end
			
			STATE_T14: begin
				out = 8'b01101001;
				nextState = STATE_T00;
			end
		endcase
	end
endmodule

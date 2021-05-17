`timescale 1ns / 1ps
`include "lib/defines.vh"

module logical_unit(
		output reg [3:0] res,
		output reg [7:0] btn_counter,
		input      [3:0] operand1,
		input      [3:0] operand2,
		input      [1:0] selector,
		input      reset,
		input      clock
    );

	/* TODO: Define local variables */
	wire selector0_debounced;
	wire selector1_debounced;
	debouncer db0(selector0_debounced, selector[0], clock, reset);
	debouncer db1(selector1_debounced, selector[1], clock, reset);
	reg[7:0] count;
 
	initial begin
		count = 0;
	end
	
	/*
	 * TODO: On reset reinitialize the module and increase the counter, 
	 *       otherwise describe the circuit logic in procedural manner.
	 */
	always @(clock) begin
		if (reset) begin
			res = 0;
			count = count + 1;
		end else begin
			case ({selector1_debounced, selector0_debounced})
				2'b00: res = operand1 ^ operand2;
				2'b01: res = ~(operand1 & operand2);
				2'b10: res = operand1 | operand2;
				2'b11: res = operand1 & operand2;
				default: res = 0;
			endcase
		end
		btn_counter = count;
	end
	
	/*
	 * BONUS: For an easier development, we suggest using a new
     *       procedural block synchronized with the clock.
	 * Hint: Use `SECOND define for counting the clock cycles.
	 */
endmodule


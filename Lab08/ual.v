`include "defines.vh"
module ual(
        output  [1: 0] flags,
        output  [7: 0]  out,
        input   [3: 0]  in0,
        input   [3: 0]  in1,
        input   [4: 0]  sel
    );

    wire    [7: 0]  out_nander;
    wire    [7: 0]  out_xorer;
    wire    [7: 0]  out_adder;
    wire    [7: 0]  out_subtractor;
    wire    [7: 0]  out_multiplier;

    assign out_nander = {4'b0000, ~(in0 & in1)};
    assign out_xorer = {4'b0000, (in0 ^ in1)};

    // TODO use adder and put the result in out_adder
	 adder add(out_adder, in0, in1);
	 // TODO use subtractor and put the result in out_subtractor
	 subtractor sub(out_subtractor, in0, in1);
	 // TODO use multiplier and put the result in out_multiplier
	 multiplier mult(out_multiplier, in0, in1);

    // TODO: use "?:"
	 // sel == 1 => NAND
    // sel == 2 => XOR
    // sel == 4 => ADD
    // sel == 8 => SUB
    // sel == 16 => MUL
    assign out = (sel == 5'd1)? out_nander :
			(sel == 5'd2)? out_xorer :
         (sel == 5'd4)? out_adder:
         (sel == 5'd8)? out_subtractor :
         (sel == 5'd16)? out_multiplier :
         8'd0;

	// TODO BONUS check whether OF is activated; remember which operations can modify it
	// TODO BONUS check whether ZF is activated
	// TODO BONUS use the defines from defines.vh
	assign flags[0] = (sel == 5'b00100 && in0[3] == in1[3] && out[3] != in0[3])? 1
		:(sel == 5'b01000 && in0[3] != in1[3] && out[3] != in0[3])? 1:0;
	assign flags[1] = (out == 4'b0000)? 1:0;

endmodule

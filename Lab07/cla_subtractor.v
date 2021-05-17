`timescale 1ns / 1ps

module cla_subtractor (
        output  [3:0] diff,
        output        c_out,
        input   [3:0] a,
        input   [3:0] b
    );

    //TODO 2: implemetati logica pentru un scazator carry-lookahead pe 4 biti
	wire[3:0] b_comp2;
	assign b_comp2 = ~b + 1;
	
	cla_adder cl_add(diff, c_out, a, b_comp2, 0);
	 
endmodule


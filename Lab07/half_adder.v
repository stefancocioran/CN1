`timescale 1ns / 1ps
module half_adder(
    output  S,
    output  C,
    input   A,
    input   B
    );

    wire #4 S_delayed, C_delayed;
    assign S = S_delayed;
    assign C = C_delayed;
	 
    xor (S_delayed, A, B);
    and (C_delayed, A, B);
endmodule

`timescale 1ns / 1ps

module full_adder(
    output  S,
    output  Cout,
    input   A,
    input   B,
    input   Cin
    );

    wire    S0;
    wire    Cout0;
    wire    Cout1;
    wire #(2) Cout_delayed;
    assign Cout = Cout_delayed;
	 
    half_adder ha0(S0, Cout0, A, B);
    half_adder ha1(S, Cout1, S0, Cin);
    or (Cout_delayed, Cout0, Cout1);
endmodule

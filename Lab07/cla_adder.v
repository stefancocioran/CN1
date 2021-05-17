`timescale 1ns / 1ps

module cla_adder (
        output  [3:0] sum,
        output        c_out,
        input   [3:0] a,
        input   [3:0] b,
        input         c_in
    );

	//TODO 1: implemetati logica unui sumator carry-lookahead pe 4 biti
	wire [3:0] #4 carry_la;
	wire [3:0] #4 P, G;
	
	assign P = a ^ b;
	assign G = a & b;
	assign carry_la[0] = c_in;
	assign carry_la[1] = G[0] | (P[0] & c_in);
	assign carry_la[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & c_in);
	assign carry_la[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & c_in);

	assign sum = P ^ carry_la;
	assign c_out = carry_la[3];
	
endmodule



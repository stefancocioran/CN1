`timescale 1ns / 1ps

module rpc_adder(
        output  [3:0] sum,
        output        c_out,
        input   [3:0] a,
        input   [3:0] b,
        input         c_in
    );
	
   //TODO 4: implemetati logica pentru un sumator ripple-carry pe 4 biti
	wire [2:0] carry_out;

	full_adder fa1 (sum[0], carry_out[0], a[0], b[0], c_in);

	full_adder fa2 (sum[1], carry_out[1], a[1], b[1], carry_out[0]);

	full_adder fa3 (sum[2], carry_out[2], a[2], b[2], carry_out[1]);

	full_adder fa4 (sum[3], c_out, a[2], b[2], carry_out[2]);
	 
endmodule

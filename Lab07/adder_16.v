`timescale 1ns / 1ps

module adder_16(
		 output[15:0] sum,
		 output c_out,
		 input[15:0] a,
		 input[15:0] b,
		 input c_in
    );
	
	// TODO 3: implementati un adder pe 16 de biti (Hint: don't write too much code)
	wire c[2:0];
	cla_adder cla1 (sum[3:0], c[0], a[3:0], b[3:0], c_in);
	cla_adder cla2 (sum[7:4], c[1], a[7:4], b[7:4], c[0]);
	cla_adder cla3 (sum[11:8], c[2], a[11:8], b[11:8], c[1]);
	cla_adder cla4 (sum[15:12], c_out, a[15:12], b[15:12], c[2]);
	
endmodule

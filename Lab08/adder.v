`include "defines.vh"
module adder(
        output  [7: 0]  S,
        input   [3: 0]  A,
        input   [3: 0]  B
    );
	
	// TODO: Implement a carry look-ahead adder
	wire [4:0] carry_la;
	wire [3:0] P, G;
	wire c_in;
	assign c_in = 0;
	
	assign P = A ^ B;
	assign G = A & B;
	assign carry_la[0] = c_in;
	assign carry_la[1] = G[0] | (P[0] & c_in);
	assign carry_la[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & c_in);
	assign carry_la[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & c_in);
	assign carry_la[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0])|(P[3] & P[2] & P[1] & P[0] & c_in);
	
	assign S[0] = P[0]^carry_la[0];
	assign S[1] = P[1]^carry_la[1];
	assign S[2] = P[2]^carry_la[2];
	assign S[3] = P[3]^carry_la[3];
	assign S[4] = carry_la[4];
	assign S[7:5] = 2'b00;
	
endmodule


`include "defines.vh"
module subtractor(
        output  [7: 0]  D,
        input   [3: 0]  A,
        input   [3: 0]  B
    );
	
    wire [7:0] tmp;

	// TODO: implement a subtractor
	wire[3:0] B_comp2;
	assign B_comp2 = ~B + 1;
	
	adder cl_add(tmp, A, B_comp2);
	assign D[7:4] = 4'b0000;
	assign D[3:0] = tmp[3:0];

endmodule


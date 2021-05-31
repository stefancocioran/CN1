`include "state_machine.vh"
`include "alu_opsel.vh"

module cpu(
	input reset, clk
	);

	/*
	 * Processor registers. Rd and Rr refer to registers from this array.
	 */
	reg [7:0] registers [31:0];
	integer   i;

	always @(posedge reset) begin
		for (i = 0; i < 32; i = i + 1) begin
			registers[i] = i;
		end
	end

	reg	 [7:0]  program_counter;
	wire [31:0] instruction;

	memory instruction_memory(
		.data(instruction),
		.address(program_counter),
		.clk(clk)
	);

	wire [7:0] op1;
	wire [7:0] op2;
	wire [2:0] opsel;
	
	decoder decoder_unit(
		.op1(op1),
		.op2(op2),
		.opsel(opsel),
		.instruction(instruction)
	);

	wire [7:0] alu_A;
	wire [7:0] alu_B;
	wire [7:0] alu_R;
	wire [2:0] alu_opsel;
	wire [7:0] alu_address;


	assign alu_A = (opsel == `OPSEL_AND || opsel == `OPSEL_OR ||
		opsel == `OPSEL_XOR || opsel == `OPSEL_NEG ||
		opsel == `OPSEL_ADD || opsel == `OPSEL_SUB) ?
		registers[op1] : op1;
	assign alu_B = (opsel == `OPSEL_AND || opsel == `OPSEL_OR ||
		opsel == `OPSEL_XOR || opsel == `OPSEL_NEG ||
		opsel == `OPSEL_ADD || opsel == `OPSEL_SUB) ?
		registers[op2] : op2;
	assign alu_opsel = opsel;
	assign alu_address = op1[7:0];

	alu execution_unit(
		.R(alu_R),
		.A(alu_A),
		.B(alu_B),
		.opsel(alu_opsel)
	);

	/*
	 * TODO 1: These signals link the EX and MEM stages.
	 */
	wire	[7:0] mem_address;
	wire	[7:0] mem_value;
	/*
	 * As we don't have a memory, this is indeed everything the MEM stage does.
	 */
	assign mem_address = alu_address;
	assign mem_value   = alu_R;

	/*
	 * TODO 1: These signals link the MEM and WB stages.
	 */
	wire [7:0] wb_address;
	wire [7:0] wb_value;

	assign wb_address = mem_address;
	assign wb_value   = mem_value;

	reg	[2:0]		state;
	reg	[2:0]		next_state;

	always @(state) begin
		/*
		 * TODO 1: We need to write back to registers a new value.
		 * TODO 1: When do we do that ?
		 */
		if (state == `STATE_WB) begin
			if (wb_address !== 8'hxx) begin
				registers[wb_address] = wb_value;
			end
		end
		
	end

	always @(posedge clk or posedge reset) begin
		if (reset) begin
			state <= `STATE_RESET;
		end else begin
			state <= next_state;
		end
	end

	always @(*) begin
		case (state)
		/*
		 * TODO 1: This is where the transitions happen. Modify
		 * next_state according to the current state.
		 * HINT: Take a look at state_machine.vh
		 */
		 `STATE_RESET: begin
			next_state = `STATE_IF;
		 end
		 
		 `STATE_IF: begin
			next_state = `STATE_ID;
		 end
		 
		 `STATE_ID: begin
			next_state = `STATE_EX;
		 end
		 
		 `STATE_EX: begin
			next_state = `STATE_MEM;
		 end
		 
		 `STATE_MEM: begin
			next_state = `STATE_WB;
		 end
		 
		 `STATE_WB: begin
			next_state = `STATE_IF;
		 end
		endcase
	end

	always @(posedge clk or posedge reset) begin
		if (reset) begin
			program_counter <= 0;
		end else begin
			/*
			 * TODO 1: When do we update program_counter ?
			 */
			if (state == `STATE_IF) begin
				program_counter <= program_counter + 1;
			end
		end
	end

endmodule

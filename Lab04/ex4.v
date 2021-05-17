module ex4(
	output  reg mutant,
	output  reg [2:0] currentState,
	input       A_debounced,
	input       G_debounced,
	input       C_debounced,
	input       T_debounced,
	input       reset,
	input       clk
	);

	localparam STATE_0 = 0;
	localparam STATE_G = 1;
	localparam STATE_GG = 2;
	
	//TODO: ce state-uri mai sunt necesare?
	//HINT: vom avea nevoie si de stari pe care nu le vom folosi
	localparam STATE_GGT = 3;
	localparam STATE_GGTC = 4;
	
	
	reg A_pressed;
   reg G_pressed;
   reg C_pressed;
   reg T_pressed;
	

	//Spre deosebire de celelalte FSM-uri din laborator,
	//acesta are scopul de a identifica un pattern.
	//Asadar ne dorim sa inregistram progresul pe care
	//il realizam cu fiecare input care contribuie la 
	//o secventa completa "GGTC".
	
	//ATENTIE: FSM-ul trebuie sa fie mereu pregatit sa
	//primeasca input, fie el corect sau gresit.
	//Asadar va trebui sa gestionam corectitudinea
	//secventei primite prin tranzitii in starile potrivite.
	//De asemenea trebuie sa fim mereu pregatiti sa intrerupem
	//sau sa reluam secventa primita

	always @(posedge clk) begin
		if (reset) begin
			currentState = STATE_0;
			mutant = 0;
			A_pressed = 0;
			G_pressed = 0;
			C_pressed = 0;
			T_pressed = 0;
		end
		else begin
			case (currentState)
				STATE_0: begin
					//TODO: tratati fiecare input posibil
					//analizati in functie de ce nucleotida a fost introdusa
					//in ce stare ar trebui sa tranzitionam
					//HINT: verificati *button*_debounced
					
					if (A_debounced) begin
						if (!A_pressed) begin
							currentState = STATE_0;
							A_pressed = 1;
						end
					end else begin
						A_pressed = 0;
					end
					
					if (G_debounced) begin
						if (!G_pressed) begin
							currentState = STATE_G;
							G_pressed = 1;
						end
					end else begin
						G_pressed = 0;
					end
					
					
					if (T_debounced) begin
						if (!T_pressed) begin
							currentState = STATE_0;
							T_pressed = 1;
						end
					end else begin
						T_pressed = 0;
					end
					
					
					if (C_debounced) begin
						if (!C_pressed) begin
							currentState = STATE_0;
							C_pressed = 1;
						end
					end else begin
						C_pressed = 0;
					end					
				end

				STATE_G: begin
					//TODO: urmati aceiasi pasi ca la STATE_0
					if (A_debounced) begin
						if (!A_pressed) begin
							currentState = STATE_0;
							A_pressed = 1;
						end
					end else begin
						A_pressed = 0;
					end
					
					if (G_debounced) begin
						if (!G_pressed) begin
							currentState = STATE_GG;
							G_pressed = 1;
						end
					end else begin
						G_pressed = 0;
					end
					
					
					if (T_debounced) begin
						if (!T_pressed) begin
							currentState = STATE_0;
							T_pressed = 1;
						end
					end else begin
						T_pressed = 0;
					end
					
					
					if (C_debounced) begin
						if (!C_pressed) begin
							currentState = STATE_0;
							C_pressed = 1;
						end
					end else begin
						C_pressed = 0;
					end
				end

				STATE_GG: begin
					//TODO: urmati aceiasi pasi ca la STATE_0
					if (A_debounced) begin
						if (!A_pressed) begin
							currentState = STATE_0;
							A_pressed = 1;
						end
					end else begin
						A_pressed = 0;
					end
					
					if (G_debounced) begin
						if (!G_pressed) begin
							currentState = STATE_GG;
							G_pressed = 1;
						end
					end else begin
						G_pressed = 0;
					end
					
					
					if (T_debounced) begin
						if (!T_pressed) begin
							currentState = STATE_GGT;
							T_pressed = 1;
						end
					end else begin
						T_pressed = 0;
					end
					
					
					if (C_debounced) begin
						if (!C_pressed) begin
							currentState = STATE_0;
							C_pressed = 1;
						end
					end else begin
						C_pressed = 0;
					end
				end

				//TODO: aplicati pasii precedenti si pentru
				//starile adaugate de voi
				
				STATE_GGT: begin
					if (A_debounced) begin
						if (!A_pressed) begin
							currentState = STATE_0;
							A_pressed = 1;
						end
					end else begin
						A_pressed = 0;
					end
					
					if (G_debounced) begin
						if (!G_pressed) begin
							currentState = STATE_G;
							G_pressed = 1;
						end
					end else begin
						G_pressed = 0;
					end
					
					
					if (T_debounced) begin
						if (!T_pressed) begin
							currentState = STATE_0;
							T_pressed = 1;
						end
					end else begin
						T_pressed = 0;
					end
					
					
					if (C_debounced) begin
						if (!C_pressed) begin
							mutant = 1;
							currentState = STATE_GGTC;
							C_pressed = 1;
						end
					end else begin
						C_pressed = 0;
					end
				
				end
				
				STATE_GGTC: begin
					mutant = 0;
					
					if (A_debounced) begin
						if (!A_pressed) begin
							currentState = STATE_0;
							A_pressed = 1;
						end
					end else begin
						A_pressed = 0;
					end
					
					if (G_debounced) begin
						if (!G_pressed) begin
							currentState = STATE_G;
							G_pressed = 1;
						end
					end else begin
						G_pressed = 0;
					end
	
					
					if (T_debounced) begin
						if (!T_pressed) begin
							currentState = STATE_0;
							T_pressed = 1;
						end
					end else begin
						T_pressed = 0;
					end
					
					
					if (C_debounced) begin
						if (!C_pressed) begin
							currentState = STATE_0;
							C_pressed = 1;
						end
					end else begin
						C_pressed = 0;
					end
				end
				
			endcase
		end
	end
endmodule
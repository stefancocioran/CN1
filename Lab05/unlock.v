`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:32:07 03/22/2020 
// Design Name: 
// Module Name:    unlock 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
	module unlock(ascii_in, out, reset, clk
    );
	 output				out;
	 input		[7:0]	ascii_in; // one digit ascii
	 input				reset;
	 input				clk;
	 
	 parameter STATE_INIT   	= 4'b0000,
              STATE_1 			= 4'b0001,
              STATE_2         = 4'b0010,
              STATE_3         = 4'b0011,
              STATE_COUNTER   = 4'b0110,
              STATE_UNLOCK    = 4'b0111,
              STATE_UNLOCK_1    = 4'b1000,
              STATE_UNLOCK_2    = 4'b1001,
              STATE_UNLOCK_3    = 4'b1010;
				  
	 reg  [3:0] 	state;
	 reg  [3:0] 	next_state;
	 reg	[7:0] 	read;
	 reg	[15:0]	time_counter;
	 reg				decrement;
	 reg	[1:0]		fail;
	 reg 				done;
	 reg	[15:0] 	timer;
	 reg timer_reset;
    reg [7:0] password[0:3];
     
     
	 always @(posedge clk) begin
		if (reset) begin
			state = STATE_INIT;
			fail = 0'b00;
            timer_reset = 0;
            decrement = 1;
            password[0] = "A";
            password[1] = "C";
            password[2] = "B";
            password[3] = "D";
		end
		else begin
			// TODO Task 1
			// setare stare urmatoare, ce valoare ia state?
			state = next_state;
					

			//TODO Task 2
			// regula de intrare in STATE_COUNTER
			end
	 end
	 
	 always @(*)begin
		if (!reset) begin
			read = ascii_in;
		end
	 end
	 
	 always @(ascii_in) begin	
		next_state = state;
		
		case (state)
		STATE_INIT: begin
			//TODO Task 2
			// coditii pentru greseli, ce se intampla cand un caracter din parola e gresita?
			// Tip: Folositi fail
			if (read == password[0]) begin
				next_state = STATE_1;
			end
			else begin
				fail = fail + 1;
				if (fail == 3) begin
					timer = "3";
					next_state = STATE_COUNTER;
				end else begin
					next_state = STATE_INIT;
				end		
			end
		end
		STATE_1: begin
			// TODO: Task 1
			if (read == password[1]) begin
				next_state = STATE_2;
			end else begin
				fail = fail + 1;
				if (fail == 3) begin
					timer = "3";
					next_state = STATE_COUNTER;
				end else begin
					next_state = STATE_INIT;
				end	
			end
			// TODO: Task 2

		end
		STATE_2: begin
			// TODO: Task 1
			if (read == password[2]) begin
				next_state = STATE_3;
			end else begin
				fail = fail + 1;
				if (fail == 3) begin
					timer = "3";
					next_state = STATE_COUNTER;
				end else begin
					next_state = STATE_INIT;
				end
			end
			// TODO: Task 2
			// Ce se intampla cand ajungem in SATE_2? (avem match pe primul caracter din parola)
		end
		STATE_3: begin
			// TODO: Task 1
			if (read == password[3]) begin
				next_state = STATE_UNLOCK;
			end else begin
				fail = fail + 1;
				if (fail == 3) begin
					timer = "3";
					next_state = STATE_COUNTER;
				end else begin
					next_state = STATE_INIT;
				end
			end
			// TODO: Task 2
			// Ce se intampla cand ajungem in SATE_3? (avem match pe priemle 2 caractere din parola)
		end
		STATE_COUNTER: begin
			// TODO Task 2
			// In starea STATE_COUNTER lacatul nu permite introducerea de caractere noi timp de 3 unitati de timp, 
			// i.e. decrementeaza un contor, plecand de la valoarea 3, iar cand contorul ajunge la 0 lacatul resetaza 
			// contorul de greseli fail la 0, trece in starea STATE_INIT si revine la pasul 1.
			if (!done) begin
				next_state = STATE_COUNTER;
			end else begin
				fail = 0;
				next_state = STATE_INIT;
			end
            
		end
		STATE_UNLOCK: begin
			//TODO Task 1: 
            next_state = STATE_UNLOCK_1;
            password[0] = read;
		end
		
		// TODO: Task 3 -> Ar trebui sa adaugam mai multe stari intermediare de unlock(e.g. STATE_UNLOCK_1) pentru resetarea parolei.
		// TIP: password ar trebui modificat
		STATE_UNLOCK_1: begin
				next_state = STATE_UNLOCK_2;
            password[1] = read;
		end
		
		STATE_UNLOCK_2: begin
				next_state = STATE_UNLOCK_3;
            password[2] = read;
		end
		
		STATE_UNLOCK_3: begin
				next_state = STATE_INIT;
            password[3] = read;
		end

		//TODO Task 1 
		//completare stari
		endcase
	end
	
	assign out = (state == STATE_UNLOCK ? 1 : 0);
	counter counter1(.ascii_in(timer), .counter(time_counter), .decrement(decrement), .done(done), .reset(timer_reset), .clock(clk));
	
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:36:39 03/22/2020 
// Design Name: 
// Module Name:    counter 
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
module counter(ascii_in, counter, decrement, done, reset, clock
    );

	output reg [15:0] counter; // 2 digits of ascii.
	output reg 			done;
	 input         decrement;
	 input         reset;
	 input         clock;
	 input	[15:0] ascii_in;

	always@(posedge clock)
	 begin
		if(reset)
			counter <= ascii_in;
		else
		begin
			if(decrement)
			begin
                if(counter == "UN") begin
                    done = 1;
                end else begin
                    if(counter == "01")
                    begin
                        counter = "UN";
                        done = 1;
                    end
                    else
                    begin
                        // TODO Task 2
                        // decrementare ASCII
								// Counter contine numbere in ascii, fiecare cifra are 1 byte: counter[7:0] si counter[15:8].
								// Tip: Aveti grija cand avem tranzitii, de exemplu 20 -> 19
								// 21 -> 20 -> 19
								while (counter != "0") begin
									if (counter[7:0] == "0") begin
										counter[7:0] = "9";
										counter[15:8] = counter[15:8] - 1;
									end else begin
										counter[7:0] = counter[7:0] - 1;
									end
								end
                        done = 1;
                    end
                end
			end
		end
	end

endmodule

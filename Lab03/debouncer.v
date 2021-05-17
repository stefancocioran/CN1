`timescale 1ns / 1ps

module debouncer(
		output     button_out,
		input      button_in,
		input      clock,
		input      reset
    );

	/* TODO: Define local variables */

	reg[7:0] count;
	reg btn_old;
	reg btn_value;
 
	initial begin
		count = 0;
		btn_old = 0;
		btn_value = 0;
	end
	
	assign button_out = btn_value;
 
	/* 
	 * TODO: On reset reinitialize the module, 
	 *       otherwise try to sample the button_in
	 */
 
	always @(posedge clock) begin
			if (reset == 1) begin
				count = 0;
				btn_old = 0;
				btn_value = 0;
        end else begin
            if (button_in == btn_old) begin
					if (count == 0) begin
						btn_value = button_in;
					end
					count = count + 1;
				end else begin
					count = 0;
				end
				btn_old = button_in;
        end
    end
  
endmodule
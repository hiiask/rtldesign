`timescale 1ns / 1ps

//`include "tb_counter4ud.v"


module  counter4_updown (      // counter4_updown = 4 Bit Up and Down Counter in Verilog
	
				output reg [3:0] cnt,
				input wire clock, reset, up );             // stage 1: Declaration of state variables and state encoding. *Declaring the states*

	reg [3:0] current_state, next_state;
	parameter 	c0 = 4'b0000, 
				c1 = 4'b0001, 
				c2 = 4'b0010, 
				c3 = 4'b0011,

				c4 = 4'b0100, 
				c5 = 4'b0101, 
				c6 = 4'b0110, 
				c7 = 4'b0111,

				c8  = 4'b1000, 
				c9  = 4'b1001, 
				c10 = 4'b1010, 
				c11 = 4'b1011,
				
				c12 = 4'b1100, 
				c13 = 4'b1101, 
				c14 = 4'b1110, 
				c15 = 4'b1111;                // stage 1: Declaration of state variables and state encoding. *Declaring the states*


	always @ ( posedge clock or negedge reset )
		begin : state_memory

			if (!reset)
				current_state <= c0;
			else
				current_state <= next_state;

		end // state_memory              Stage 2: *state memory block*. Sequential logic so non blocking assignments and assignments to the current_state


	always @ ( current_state or up )
		begin : next_state_logic

			case (current_state)

				c0	:	if (up ==1'b1)
								next_state = c1;
						else
								next_state = c15;

				c1	:	if (up ==1'b1)
								next_state = c2;
						else
								next_state = c0;

				c2	:	if (up ==1'b1)
								next_state = c3;
						else
								next_state = c1;

				c3	:	if (up ==1'b1)
								next_state = c4;
						else
								next_state = c2;

				c4	:	if (up ==1'b1)
								next_state = c5;
						else
								next_state = c3;

				c5	:	if (up ==1'b1)
								next_state = c6;
						else
								next_state = c4;

				c6	:	if (up ==1'b1)
								next_state = c7;
						else
								next_state = c5;

				c7	:	if (up ==1'b1)
								next_state = c8;
						else
								next_state = c6;

				c8	:	if (up ==1'b1)
								next_state = c9;
						else
								next_state = c7;

				c9	:	if (up ==1'b1)
								next_state = c10;
						else
								next_state = c8;

				c10	:	if (up ==1'b1)
								next_state = c11;
						else
								next_state = c9;

				c11	:	if (up ==1'b1)
								next_state = c12;
						else
								next_state = c10;

				c12	:	if (up ==1'b1)
								next_state = c13;
						else
								next_state = c11;

				c13	:	if (up ==1'b1)
								next_state = c14;
						else
								next_state = c12;

				c14	:	if (up ==1'b1)
								next_state = c15;
						else
								next_state = c13;

				c15	:	if (up ==1'b1)
								next_state = c0;
						else
								next_state = c14;

				default : next_state = c0;

			endcase
		end   // current_state        Stage 3: *Next State Logic Block*. Combinational logic so blocking assignments and assignments to the next_state


		always @ (current_state)   // sensitivity list = current_state ---- Moore Machine
			begin : output_logic

				case (current_state)

					c0 : cnt = 4'b0000; 
					c1 : cnt = 4'b0001; 
					c2 : cnt = 4'b0010;
					c3 : cnt = 4'b0011;

					c4 : cnt = 4'b0100;
					c5 : cnt = 4'b0101;
					c6 : cnt = 4'b0110;
					c7 : cnt = 4'b0111;

					c8  : cnt = 4'b1000;
					c9  : cnt = 4'b1001;
					c10 : cnt = 4'b1010;
					c11 : cnt = 4'b1011;
				
					c12 : cnt = 4'b1100;
					c13 : cnt = 4'b1101;
					c14 : cnt = 4'b1110;
					c15 : cnt = 4'b1111;
	

					default : cnt = 4'b0000;

				endcase
			end // output_logic  Stage 4: *Output Logic block*,  Combinational logic so blocking assignments
			   // moore machine,  assignments to c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15

endmodule // counter4_updown



// now you can scale up this design up to 8 bit/ 16 bit/ 32 bit/ 64 bit.............




// This FSM Design is tested successfully.
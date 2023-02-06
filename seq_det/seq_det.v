// Design a Sequence Detector :
// Whenever the bit pattern "0110" appears in the input stream, it outputs z = 1; at all other times, z = 0
// Overlapping occurrences of the pattern are also detected
// Active low Reset


module seq_det 
	(
		// input system clk, and reset
		input wire clk,
		input wire reset,
		// input bit stream
		input wire x,
		// output 
		output reg z
	);

	// state parameters
	parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
	reg [0:1] present_state, next_state;

	// state memory
	always @(negedge clk or negedge reset) 
		begin 
			if(!reset) 
				begin
					present_state <= s0;
				end 
			else 
				begin
					present_state <= next_state;
				end
		end

	// next state logic
	always @(present_state, x)
		begin

			case (present_state)

				s0 : begin
							if (x == 1'b0)
								next_state = s1;
							else
								next_state = s0;
					 end

				s1 : begin
							if (x == 1'b0)
								next_state = s1;
							else
								next_state = s2;
					 end

				s2 : begin
							if (x == 1'b0)
								next_state = s1;
							else
								next_state = s3;
					 end

				s3 : begin
							if (x == 1'b0)
								next_state = s1;
							else
								next_state = s0;
					 end
			endcase // present_state
		end

	// output logic

		always @(negedge clk)
				begin

					case (present_state)

						s0 : begin
									if (x == 1'b0)
										z = 1'b0;
									else
										z = 1'b0;
							 end

						s1 : begin
									if (x == 1'b0)
										z = 1'b0;
									else
										z = 1'b0;
							 end

						s2 : begin
									if (x == 1'b0)
										z = 1'b0;
									else
										z = 1'b0;
							 end

						s3 : begin
									if (x == 1'b0)
										z = 1'b1;
									else
										z = 1'b0;
							 end
					endcase // present_state
				end



endmodule : seq_det
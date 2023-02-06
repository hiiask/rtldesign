//`include "seq_det.v"
//`timescale 1ns/1ps


module tb_seq_det;

	reg clk, x, reset;

	wire z;

	seq_det dut (.clk(clk), .reset(reset), .x(x), .z(z));

	initial 
		begin
			$dumpfile ("sequence.vcd");
			$dumpvars (0, tb_seq_det);
		end

	// reset and clock block
	initial 
		begin
			reset = 1'b0;
			clk = 1'b0;
		end

	always
		begin
			#05 clk = ~clk;
			#15 reset = 1'b1;
		end


	initial
		begin
			#10 x = 0;
			#10 x = 0;
			#10 x = 1;
			#10 x = 1;

			#10 x = 0;
			#10 x = 1;
			#10 x = 1;
			#10 x = 0;

			#10 x = 0;
			#10 x = 1;
			#10 x = 1;
			#10 x = 0;
          
          	
          	#10 x = 0;
			#10 x = 0;
			#10 x = 1;
			#10 x = 1;

			#10 x = 0;
			#10 x = 1;
			#10 x = 1;
			#10 x = 0;

			#10 x = 0;
			#10 x = 1;
			#10 x = 1;
			#10 x = 0;
          

			#10 $finish;
		end

endmodule : tb_seq_det





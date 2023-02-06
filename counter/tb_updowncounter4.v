// Testbench for 4 bit up-down counter
`timescale 1ns / 1ps

`include "updowncounter4.v"


module updowncounter4_testbench();

	reg clk, reset,up_down;
	wire [3:0] counter;

	up_down_counter4 dut ( clk, reset,up_down, counter );

	initial begin 
		clk = 0;
		forever #5 clk = ~clk;
	end

	initial begin

		$dumpfile ("updowncounter4.vcd");
	    $dumpvars (0, updowncounter4_testbench);


		reset = 1;
		up_down = 0;
		#20;

		reset = 0;
		#200;
		up_down = 1;

		#250 $finish;

	end



endmodule 
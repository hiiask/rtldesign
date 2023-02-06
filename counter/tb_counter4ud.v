`timescale 1ns / 1ps

`include "counter4ud.v"


module tb_counter4_updown () ;     // test bench

	reg clk, rst, up;  // input
	wire [3:0] count;    // output         // wire [x:y] = Vector or Bus or Multiple Wire


	counter4_updown dut_counter4 (.cnt(count), .clock(clk), .reset(rst), .up(up));




	// generate clock
	always #10 clk = ~clk;


	initial begin

		$dumpfile ("counter4ud.vcd");
		$dumpvars (0, tb_counter4_updown);


		#0 clk = 1'b0;
		#0 rst = 1'b1;

		#000 up = 1'b1;

		#400 up = 1'b0;



		


		#800 rst = 1'b0;

		// #20 rst = 1'b1;


		
		
		

		#5 $finish;

	end

endmodule   // tst bench



// This FSM Design testbench and its respective design is tested successfully.
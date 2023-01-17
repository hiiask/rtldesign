// `include "div_int_unsign.v"


module tb_div_int_unsign;

	parameter WIDTH = 8;

	reg [WIDTH-1:0] dvd;         // Dividend
	reg [WIDTH-1:0] dvs;         // Divisor
	reg reset_n;                 // Active low reset

	wire [WIDTH-1:0] qot;        // Quotient
	wire [WIDTH-1:0] rmd;        // Reminder

	division #(.WIDTH(WIDTH)) division_inst (.dvd(dvd), .dvs(dvs), .qot(qot), .rmd(rmd), .reset_n(reset_n));


	initial 
		begin
			$dumpfile ("division.vcd");
			$dumpvars (0, tb_div_int_unsign);
		end


	initial 
		begin
        	$monitor(" \t%d:\t (Dividend =%d)/(Divisor =%d) (quotient =%d) (reminder =%d) ",$time, dvd, dvs, qot, rmd);
   		end


	initial begin

		// Initialize Inputs and wait for 100 ns
        # 000 reset_n = 0;      //Undefined inputs
        # 050 reset_n = 1;
        #050;  

        //Apply each set of inputs and wait for 100 ns.
        dvd = 100;    dvs = 10; 
        #100;
        dvd = 67;    dvs = 20; 
        #100;
        dvd = 90;     dvs = 9;  
        #100;
        dvd = 75;     dvs = 10; 
        #100;
        dvd = 16;     dvs = 3;  
        #100;
        dvd = 255;    dvs = 5;  
        #100;

	end


endmodule : tb_div_int_unsign
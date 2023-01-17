


// `include "divider.v"


module tb_divider();


        integer data1, data2;
        reg clock, reset_n;
        integer q, r;

        // parameter WIDTH = 4;


        divider divider_inst (.data1(data1), .data2(data2), .q(q), .r(r), .clock(clock), .reset_n(reset_n));


        // generate clock
        always #10 clock = ~clock;


        initial begin
                        $monitor("\t%d:\t%d /%d (q =%0.3f) (r =%d)", $time, data1, data2, q, r);
        end


        initial begin
                $dumpfile ("divider.vcd");
                $dumpvars (0, tb_divider);
        end


        initial begin

                #00 clock = 1'b0;
                #00 reset_n = 1'b0;
                #30 reset_n = 1'b1;


                #30 data1 = 0;  /* 0 */   data2 = 2;  /* 2 */

                #40 data1 = 7;  /* 7 */   data2 = 2;  /* 2 */

                #40 data1 = 15;  /* 15 */  data2 = 5;  /* 5 */

                #40 data1 = 1;  /* 1 */   data2 = 1;  /* 1 */

                #40 data1 = 8;  /* 8 */   data2 = 9;  /* 9 */

                #50     $finish;

        end


endmodule : tb_divider











module divider 
        (
                input integer data1,
                input integer data2,

                input wire clock, 
                input wire reset_n,

                output integer q,
                output integer r

        );

        // integer q_int;


        always @ ( posedge clock)
                begin

                        if ( !reset_n )
                                begin
                                        q = 0;
                                        r = 0;
                                end

                        else
                                begin
                                        q = data1 / data2;
                                        // q_int = q;
                                        r = data1 - (data2*q);
                                end
                
                end



endmodule : divider





/////////////////////////////////////////////////////////////////////////////////////////////
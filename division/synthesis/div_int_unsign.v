
module division #(parameter WIDTH)
    (

    //the size of input and output ports of the division module is 7 bit.
    //input ports
    input wire [WIDTH-1:0] dvd,      // Dividend
    input wire [WIDTH-1:0] dvs,      // Divisor

    input wire reset_n,              // active low reset
    // output ports
    output reg [WIDTH-1:0] qot,      // Quotient
    output reg [WIDTH-1:0] rmd       // Reminder

    );

    initial 
        begin
            rmd = 0;                 // intializing reminder and quotient to 0
            qot = 0;   
        end

    // internal variables    
    reg [WIDTH-1:0] dvd_copy;        // copy of dividend
    reg [WIDTH-1:0] dvs_copy;        // copy of divisor
    reg [WIDTH:0] m;                 // n+1 bit register M
    reg [WIDTH:0] acml;              // n+1 bit register Accumulator
    reg [WIDTH-1:0] q;               // n bit register Q
    integer n;                       // n which will keep track of iteration

    always @ ( dvd or dvs )
        begin
            if (!reset_n)
                begin
                    qot = 0;
                    rmd = 0;
                end
            else
                begin
                    dvd_copy = dvd;
                    dvs_copy = dvs;
                    // intializing the values
                    acml = 0;
                    m = {1'b0,dvs_copy};
                    q = dvd_copy;


                    for ( n=WIDTH; n>0; n=n-1 )
                        begin
                            acml = {acml[WIDTH-1:0],q[WIDTH-1]};  
                            q[WIDTH-1:1] = q[WIDTH-2:0];
                            // Left Shifting A and Q together
                            acml = acml - m;

                            if (acml[WIDTH] == 0)
                                begin
                                     q[0] = 1;
                                 end
                            else
                                begin
                                    q[0] = 0;
                                    acml = acml + m;
                                end
                        end

                    qot = q;
                    rmd = acml;
                    
                end
        end


endmodule : division







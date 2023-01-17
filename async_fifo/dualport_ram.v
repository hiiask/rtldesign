
module dualport_ram # ( parameter AWIDTH = 9, parameter DWIDTH = 16 )
    (
        input                       arst_n,      // asynchronous reset
        input                       wclk,        // writing circuit's clock
        input                       wen,         // enable signal to register the write data to FIFO buffer
        input [AWIDTH-1:0]          waddr,       // write address for the FIFO buffer
        input [DWIDTH-1:0]          wdata,       // data to be written by the writing circuit

        input                       rclk,        // reading circuit's clock
        input                       ren,         // enable signal to update the read bus from FIFO buffer
        output reg                  rdv,         // data valid signal. Reading circuit can safely register the data on the data bus
        input       [AWIDTH-1:0]    raddr,       // read address for the FIFO buffer
        output reg [DWIDTH-1:0]     rdata        // data to be read by the reading circuit
    );



  reg [DWIDTH-1:0] mem [0:2**AWIDTH-1];          // the actual memory block

  always @(posedge wclk) 
      begin                                      // writing data to FIFO
        if (wen)
          mem[waddr] <= wdata;                  
      end

  always @(posedge rclk, negedge arst_n) 
      begin                                      // ckecking read data valid signal for putting read data on data bus
        if (!arst_n)
            rdv <= 1'b0;
        else
            rdv <= ren;
      end

  // assign rdata = mem[raddr];
  always @(posedge rclk, negedge arst_n) 
      begin                                      // reading data from FIFO
        if (!arst_n)
            rdata <= 1'b0;
        else if (ren)
            rdata <= mem[raddr];
      end


endmodule






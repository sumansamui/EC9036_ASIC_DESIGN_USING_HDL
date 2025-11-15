//=====================================================
// Testbench for sync_fifo_4x256
//=====================================================
`timescale 1ns/1ps

module tb_sync_fifo_4x256;

    // --------------------------------------------
    // DUT (Device Under Test) signals
    // --------------------------------------------
    reg clk;
    reg rst;
    reg wr_en;
    reg rd_en;
    reg [3:0] din;
    wire [3:0] dout;
    wire full;
    wire empty;

    // --------------------------------------------
    // Instantiate the FIFO
    // --------------------------------------------
    sync_fifo_4x256 uut (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .din(din),
        .dout(dout),
        .full(full),
        .empty(empty)
    );

    // --------------------------------------------
    // Clock Generation (10 ns period)
    // --------------------------------------------
    initial clk = 0;
    always #5 clk = ~clk;
                                
                                
                                
    initial 
        // Initialize
        rst   = 1;

        // Hold reset for 2 clock cycles
        #15 rst = 0;           
        
     end                 
    // --------------------------------------------
    // Stimulus
    // --------------------------------------------
    initial begin
        // Initialize
        rst   = 1;
        wr_en = 0;
        rd_en = 0;
        din   = 4'b0000;

        // Hold reset for 2 clock cycles
        #15 rst = 0;

        // Write a few values
        #10 wr_en = 1; din = 4'hA; // Write A
        #10 din = 4'hB;            // Write B
        #10 din = 4'hC;            // Write C
        #10 wr_en = 0;             // Stop writing

        // Read them back
        #20 rd_en = 1;             // Read first (A)
        #10;                       // Wait
        #10;                       // Read second (B)
        #10;                       // Read third (C)
        rd_en = 0;

        // End simulation
        #30 $finish;
    end

    // --------------------------------------------
    // Monitor to see FIFO activity
    // --------------------------------------------
    initial begin
        $monitor("%0t\t%b\t%b\t%b\t%b\t%h\t%h\t%b\t%b",
                 $time, clk, rst, wr_en, rd_en, din, dout, full, empty);
    end

endmodule

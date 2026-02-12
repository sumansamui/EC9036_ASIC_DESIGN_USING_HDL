//=====================================================
// Synchronous FIFO
// Data width  : 4 bits
// Address size: 8 bits (Depth = 256)
// - Single clock
// - Synchronous reset
// - Memory read and write in one always block
// - All flag and control logic in if-else form
//=====================================================
module sync_fifo_4x256 #(
    parameter DATA_WIDTH = 4,
    parameter ADDR_WIDTH = 8,
    parameter DEPTH = 256
)(
    input                     clk,
    input                     rst,       // synchronous, active-high reset
    input      [DATA_WIDTH-1:0] din,     // data input
    input                     wr_en,     // write enable
    input                     rd_en,     // read enable
    output reg [DATA_WIDTH-1:0] dout,    // data output
    output reg                full,      // FIFO full flag
    output reg                empty      // FIFO empty flag
);

    // ----------------------------------------------------
    // Internal declarations
    // ----------------------------------------------------
    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];  // memory array
    reg [ADDR_WIDTH-1:0] wr_ptr;           // write pointer
    reg [ADDR_WIDTH-1:0] rd_ptr;           // read pointer
    reg [ADDR_WIDTH:0]   count;            // item counter (0–DEPTH)
    reg                  do_write;         // internal write condition
    reg                  do_read;          // internal read condition

    // ----------------------------------------------------
    // Flag and control logic using IF-ELSE (combinational)
    // ----------------------------------------------------
    always @(*) begin
    full     = (count == DEPTH) ? 1'b1 : 1'b0;
    empty    = (count == 0)     ? 1'b1 : 1'b0;
    do_write = (wr_en && !full) ? 1'b1 : 1'b0;
    do_read  = (rd_en && !empty)? 1'b1 : 1'b0;
    end


    integer i;
   // --------------------------------------------
    // Initialization block (runs once at simulation start)
    // --------------------------------------------
    initial begin
        dout = 0;
        for (i = 0; i < DEPTH; i = i + 1)
            mem[i] = 0;   // initialize all memory locations to zero
    end

    // --------------------------------------------
    // Normal read/write operation (no reset here)
    // --------------------------------------------
    always @(posedge clk) begin
        if (do_write)
            mem[wr_ptr] <= din;      // WRITE

        if (do_read)
            dout <= mem[rd_ptr];     // READ
    end

    // ----------------------------------------------------
    // Write Pointer Logic
    // ----------------------------------------------------
    always @(posedge clk) begin
        if (rst)
            wr_ptr <= 0;
        else if (do_write) begin
            if (wr_ptr == (DEPTH - 1))
                wr_ptr <= 0;
            else
                wr_ptr <= wr_ptr + 1;
        end
    end

    // ----------------------------------------------------
    // Read Pointer Logic
      // ----------------------------------------------------
    always @(posedge clk) begin
        if (rst)
            rd_ptr <= 0;
        else if (do_read) begin
            if (rd_ptr == (DEPTH - 1))
                rd_ptr <= 0;
            else
                rd_ptr <= rd_ptr + 1;
        end
    end

    // ----------------------------------------------------
    // Count Logic (number of elements in FIFO)
    // ----------------------------------------------------
    always @(posedge clk) begin
        if (rst)
            count <= 0;
        else begin
            case ({do_write, do_read})
                2'b10: count <= count + 1;  // write only
                2'b01: count <= count - 1;  // read only
                default: count <= count;    // both or none
            endcase
        end
    end

endmodule

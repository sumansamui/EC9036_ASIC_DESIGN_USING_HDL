//===========================================
// 4-bit x 256 Single-Port Memory
// Read/Write using same address port
// Write has priority if both enables are high
//===========================================
module simple_rw_memory (
    input        clk,
    input        rst,
    input        wr_en,          // write enable
    input        rd_en,          // read enable
    input  [7:0] addr,           // 8-bit address (256 locations)
    input  [3:0] data_in,        // input data
    output reg [3:0] data_out    // output data
);

    reg [3:0] mem [0:255];       // 256 x 4-bit memory
    integer i;

    always @(posedge clk) begin
        if (rst) begin
            data_out <= 4'b0000;
            for (i = 0; i < 256; i = i + 1)
                mem[i] <= 4'b0000;
        end
        else begin
            if (wr_en) begin
                mem[addr] <= data_in;      // WRITE operation
            end
            else if (rd_en) begin
                data_out <= mem[addr];     // READ operation
            end
        end
    end

endmodule

                 
module moving_avg_4_filter (
    input  wire       clk,
    input  wire       rst,       // synchronous reset (active high)
    input  wire [7:0] x_in,      // new input sample
    output reg  [7:0] y_out      // averaged output
);
    // Shift registers for previous samples
    reg [7:0] x1, x2, x3;
     
    wire [9:0] sum;
    
    wire [7:0] avg;   
    
    // Intermediate sum (max 4*255=1020 -> needs 10 bits)
    assign sum = x_in + x1 + x2 + x3;

    // Average (integer division by 4 using right shift)
     assign avg = sum[9:2];                                                        
                                                       
    // Sequential logic: update registers and output
    always @(posedge clk) begin
        if (rst) begin                                            
            x1 <= 8'd0;
            x2 <= 8'd0
            x3 <= 8'd0;
            y_out <= 8'd0;
        end else begin
            x3 <= x2;
            x2 <= x1;
            x1 <= x_in;
            y_out <= avg;
        end
    end
endmodule





//=====================================================
// Parameterized 4-Point Moving Average Filter
// Unsigned N-bit input, output each clock
// y[n] = (x[n] + x[n-1] + x[n-2] + x[n-3]) / 4
//=====================================================

module moving_avg_4_param #(
    parameter integer WIDTH = 8   // input/output width
)(
    input  wire                 clk,
    input  wire                 rst,     // synchronous active-high reset
    input  wire [WIDTH-1:0]     x_in,    // current input
    output reg  [WIDTH-1:0]     y_out    // averaged output
);
    // Delay elements
    reg [WIDTH-1:0] x1, x2, x3;

    // Sum width = WIDTH + log2(4) = WIDTH + 2
    wire [WIDTH+1:0] sum = x_in + x1 + x2 + x3;

    // Divide by 4 → right-shift by 2 bits (hardware-efficient)
    wire [WIDTH-1:0] avg = sum>>2;

    // Sequential update
    always @(posedge clk) begin
        if (rst) begin
            x1    <= {WIDTH{1'b0}};
            x2    <= {WIDTH{1'b0}};
            x3    <= {WIDTH{1'b0}};
            y_out <= {WIDTH{1'b0}};
        end else begin
            x3    <= x2;
            x2    <= x1;
            x1    <= x_in;
            y_out <= avg;
        end
    end
endmodule





















`timescale 1ns/1ps
module ma4_filter_oneblock #(
    parameter integer W = 8
)(
    input  wire             clk,
    input  wire             rst,       // active-high synchronous reset
    input  wire [W-1:0]     x_in,      // current input sample
    output reg  [W-1:0]     y_out      // averaged output
);
    // Registers for last 3 samples
    reg [W-1:0] x1, x2, x3;

    always @(posedge clk) begin
        if (rst) begin
            x1    <= 0;
            x2    <= 0;
            x3    <= 0;
            y_out <= 0;
        end else begin
            // Compute average directly without intermediate sum register
            y_out <= (x_in + x1 + x2 + x3) >> 2;  
            

            // Update shift register
            x3 <= x2;
            x2 <= x1;
            x1 <= x_in;
        end
    end
endmodule   


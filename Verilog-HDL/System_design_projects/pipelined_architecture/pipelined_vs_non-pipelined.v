//========================================
// Non-pipelined implementation
//========================================
module arithmetic_nonpipe (
    input  wire        clk, rst,
    input  wire [7:0]  A, B, C, D,
    output reg  [15:0] Y
);
    always @(posedge clk) begin
        if (rst)
            Y <= 0;
        else
            Y <= ((A + B) * C) + D;   // All operations in same cycle
    end
endmodule


//========================================
// 3-stage pipelined implementation
//========================================
module arithmetic_pipe (
    input  wire        clk, rst,
    input  wire [7:0]  A, B, C, D,
    output reg  [15:0] Y
);
    reg [7:0] sum_reg;
    reg [15:0] mul_reg;

    always @(posedge clk) begin
        if (rst) begin
            sum_reg <= 0;
            mul_reg <= 0;
            Y <= 0;
        end
        else begin
            sum_reg <= A + B;            // Stage 1: add
            mul_reg <= sum_reg * C;      // Stage 2: multiply
            Y <= mul_reg + D;            // Stage 3: add
        end
    end
endmodule
                              
                              
                              
//=========================================================
// Testbench for Y = (A + B) * C + D
//=========================================================
`timescale 1ns/1ps

module arithmetic_tb;
    reg clk, rst;
    reg [7:0] A, B, C, D;
    wire [15:0] Y_nonpipe, Y_pipe;

    // Instantiate Non-pipelined Design
    arithmetic_nonpipe uut_nonpipe (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .Y(Y_nonpipe)
    );

    // Instantiate Pipelined Design
    arithmetic_pipe uut_pipe (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .Y(Y_pipe)
    );

    // Clock Generation: 10 ns period (100 MHz)
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        clk = 0; 
        rst = 1;
        A = 0; B = 0; C = 0; D = 0;
        #12 rst = 0;

        // Apply multiple input sets every 10 ns
        #10 A=2; B=3; C=4; D=1;    // Expected: (2+3)*4+1 = 21
        #10 A=1; B=1; C=2; D=2;    // Expected: (1+1)*2+2 = 6
        #10 A=5; B=3; C=2; D=1;    // Expected: (5+3)*2+1 = 17
        #10 A=4; B=4; C=3; D=2;    // Expected: (4+4)*3+2 = 26
        #10 A=8; B=1; C=2; D=5;    // Expected: (8+1)*2+5 = 23

        #50 $finish;
    end

    // Display outputs on console
    initial begin
        $monitor("Time=%0t | A=%d B=%d C=%d D=%d | Y_nonpipe=%d | Y_pipe=%d", 
                  $time, A, B, C, D, Y_nonpipe, Y_pipe);
    end
endmodule
                              
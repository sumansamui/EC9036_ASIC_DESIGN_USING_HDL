module counter_en (
    input  wire       clk,
    input  wire       rst,     // synchronous reset (active high)
    input  wire       en,      // enable
    output [7:0]      count    // 8-bit counter
);
    reg [7:0] ps,ns;  
    always @(posedge clk or posedge rst) begin
        if (rst)
            ps <= 8'd0;             // reset to 0
        else if (en)
            ps <= ns;     // increment if enable is high
    end
    
    
    always @ (*)begin
        ns <= ps + 1;
    end
    
    assign count = ps;    
endmodule

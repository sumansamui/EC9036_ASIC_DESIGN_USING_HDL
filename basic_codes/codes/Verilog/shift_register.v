
 //Left-Shift_Register_Blocking
 module Shift_Register_Blocking (
    input wire clk,
    input wire reset,
    input wire serial_in,
    output reg [3:0] q);
    
    always @(posedge clk or posedge reset) begin   
    
        if (reset) begin      
        
            q = 4'b0000; // Reset the register
        
        end else begin
        	q[0] = serial_in;
            q[1] = q[0]; // Load new serial input
            q[2] = q[1];
            q[3] = q[2];
             
        end
    end
 endmodule
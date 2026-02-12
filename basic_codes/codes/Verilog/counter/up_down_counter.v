`timescale 1ns / 1ps
module loadable_up_down_counter(
    input clk,
    input rst,
	 input load,
    input [3:0] din,
	 input dir,
    output reg [3:0] count
    );
always @(posedge clk or posedge rst)
begin  
if(rst==1'b1)
	count<=4'b0000;
else if(load==1'b1)
   count<=din;
else if(dir==1'b1)
	count<=count + 1;
else if(dir==1'b0)
	count<=count - 1;	
end
endmodule

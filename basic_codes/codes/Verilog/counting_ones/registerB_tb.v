`timescale 1ns / 1ps


module registerB_tb;

wire [3:0] q;
reg reset;
reg count_enable;
reg clk;

registerB r1(reset,count_enable,clk,q);

initial begin
clk=1'b0; reset=1'b1; count_enable=1'b0;

#50; reset=1'b0; 

#100 count_enable=1'b1;

#100 count_enable=1'b1;

#100 count_enable=1'b1;

end

always #10 clk=~clk;

endmodule

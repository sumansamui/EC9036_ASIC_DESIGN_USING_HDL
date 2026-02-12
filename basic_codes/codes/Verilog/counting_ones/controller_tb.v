`timescale 1ns / 1ps
module controller_tb;

reg clk;
reg z;
reg start;
reg go;
wire sr, load, reset;

wire [1:0] ps,ns;
controller c1(go,clk,z,start,sr,load,reset,ps,ns);

initial begin
clk=1'b0;z=1'b0;start=1'b0;go=1'b1;

#100;
z=1'b1;start=1'b1;

#100; z=1'b0;start=1'b0;


end
always #10 clk=~clk;
endmodule

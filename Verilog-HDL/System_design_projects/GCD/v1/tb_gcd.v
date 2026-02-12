`timescale 1ns / 1ps

module tb_gcd;

reg clk,rst,go;
reg [7:0] data_in1,data_in2;
wire [7:0] out;
wire done,output_en;
wire [3:0] ps, ns;

top_design uut(clk,rst,go,data_in1,data_in2,out,done,ps,ns,output_en);

initial begin
data_in1=8'd42; data_in2=8'd12;clk=0;
#10;
rst=1;
#20;
rst=0;
#25;
go=1;
#130
go=0;

end



always #55 clk=~clk;   
endmodule

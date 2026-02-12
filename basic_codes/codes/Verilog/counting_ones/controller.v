`timescale 1ns / 1ps
module controller (go,clk,z,start,sr,load,reset,ps,ns);
input clk;
input z;
input start;
input go;
output reg sr;
output reg load;
output reg reset;
parameter s0=2'b00,s1=2'b01,s2=2'b10; 
output reg [1:0] ps,ns;

always @(posedge clk) begin
if (go==1'b1)
ps<=s0;
else
ps<=ns;
end

always @(ps,z,start) begin
case(ps)
s0: begin
if (start==1'b1)
ns=s1;
end
s1:begin
if (z==1'b1)
ns=s2;
end
s2:begin
if (go==1'b1)
ns=s0;
end
default: ns=s0;
endcase
end

always @(ps,start,z)
begin
case(ps)
s0: begin
if (start==1'b1)
load=1'b1;reset=1'b1;
end
s1:begin
if (z==1'b1) 
sr=1'b0;
else 
sr=1'b1;
end
default: begin sr=1'b0;load=1'b0;reset=1'b0; end

endcase
end
endmodule
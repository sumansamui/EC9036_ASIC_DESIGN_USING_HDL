module decoder2_4 (din,dout);

output [3:0] dout ;

input [1:0] din ;

 assign dout[0] = din==2'b00 ? 1'b1 : 1'b0;
 assign dout[1] = din==2'b01 ? 1'b1 : 1'b0;
 assign dout[2] = din==2'b10 ? 1'b1 : 1'b0;
 assign dout[3] = din==2'b11 ? 1'b1 : 1'b0;

endmodule
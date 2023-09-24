// Majority circuit using wire

module majority_ckt1(input a,b,c,output y);
wire s1,s2,s3,s4;    
assign s1=a&b;
assign s2=b&c;
assign s3=c&a;
assign s4=s1|s2;
assign y=s3|s4;         
endmodule 

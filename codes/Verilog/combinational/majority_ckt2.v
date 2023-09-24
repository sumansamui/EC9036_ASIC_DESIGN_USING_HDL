// Majority circuit using reg

module majority_ckt2(input a,b,c,output reg y);
always @(a or b or c) begin
y=(a&b)|(b&c)|(c&a);
end        
endmodule      

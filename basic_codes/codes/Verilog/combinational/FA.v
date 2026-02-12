module FA(a,b,cin,s,cout);
input a,b,cin;
output s,cout;
wire s1,c1,c2;
// instatiate HAs
HA m1(a,b,s1,c1);
HA m2(s1,cin,s,c2);
or o1(c,c1,c2);
endmodule

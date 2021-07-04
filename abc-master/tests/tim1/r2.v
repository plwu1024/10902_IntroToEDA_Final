module top(o, a, b, c);
input a, b, c;
output o;
wire n1;
and g1(n1, a, b);
and g2(o, n1, c);
endmodule
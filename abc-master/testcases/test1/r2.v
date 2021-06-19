module top(o, a, b, c);
output o;
input a, b, c;
wire t_0;
or g2(o, t_0, a, n1);
and g1(n1, b, c);
endmodule

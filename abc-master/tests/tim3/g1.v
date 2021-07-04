module top(o, a, b, c);
input a, b, c, d, e, f, g, h;
output o;
wire n1, n2, n3, n4, n5, n6;
or g1(n1, a, b);
and g2(n2, c, d);
or g3(n3, e, f);
and g4(n4, g, h);
or g5(n5, n1, n2);
and g6(n6, n3, n4);
and g7(o, n5, n6);
endmodule
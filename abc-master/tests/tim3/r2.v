module top(o, a, b, c);
input a, b, c, d, e, f, g, h;
output o;
wire n1, n2, n3, n4, n5, n6;
and g1(n1, a, b);
or g2(n2, c, d);
and g3(n3, e, f);
or g4(n4, g, h);
and g5(n5, n1, n2);
or g6(n6, n3, n4);
and g7(o, n5, n6);
endmodule
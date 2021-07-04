module top(o, a, b, c, d, e, f, g, h, i, j);
output o;
input a, b, c, d, e, f, g, h, i, j;
wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10;
or g1 (w1, a, b);
and g2 (w2, c, d);
and g3 (w3, e, f);
or g4 (w4, g, h);
and g5 (w5, i, j);
not g6 (w6, w1);
or g7 (w7, w2, w3);
not g8 (w8, w4);
or g9 (w9, w8, w5);
or g10 (w10, w6, w7);
or g11 (o, w10, w9);
endmodule

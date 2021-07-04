module top(o, a, b, c, d, e, f, g, h, i, j);
output o;
input a, b, c, d, e, f, g, h, i, j;
wire w1, w2, w3, w4, w5, w6, w7, w8;
or g1 (w1, a, b);
or g2 (w2, g, h);
nand g3 (w3, w1, w2);
and g4 (w4, c, d);
and g5 (w5, e, f);
and g6 (w6, i, j);
or g7 (w7, w3, w4);
or g8 (w8, w5, w6);
or g9 (o, w7, w8);
endmodule
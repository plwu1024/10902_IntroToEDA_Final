module top(o, a, b, c, d, e, f, g, h, i, j, k, l);
output o;
input a, b, c, d, e, f, g, h, i, j, k, l;
wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10;
wire w11, w12, w13, w14, w15, w16, w17, w18, w19, w20;
wire w21, w22;
and g1 (w1, a, b);
and g2 (w2, c, d);
and g3 (w3, e, f);
and g4 (w4, g, h);
and g5 (w5, i, j);
and g6 (w6, k, l);
nor g7 (w7, w1, w4);
nor g8 (w8, w1, w5);
nor g9 (w9, w1, w6);
nor g10 (w10, w2, w4);
nor g11 (w11, w2, w5);
nor g12 (w12, w2, w6);
nor g13 (w13, w3, w4);
nor g14 (w14, w3, w5);
nor g15 (w15, w3, w6);
or g16 (w16, w7, w8);
or g17 (w17, w9, w10);
or g18 (w18, w11, w12);
or g19 (w19, w13, w14, w15);
nand g20 (w20, w16, w18);
nand g21 (w21, w17, w19);
not g22 (w22, w20);
or g23 (o, w21, w22);
endmodule
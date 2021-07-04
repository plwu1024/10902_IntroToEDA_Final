module top(o, a, b, c, d, e, f, g, h, i, j);
output o;
input a, b, c, d, e, f, g, h, i, j;
wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10;
wire w11, w12, w13, w14, w15, w16, w17, w18, w19, w20;
wire w21, w22, w23, w24, w25;
and g1 (w1, a, b);
and g2 (w2, c, d);
and g3 (w3, e, f);
and g4 (w4, g, h);
and g5 (w5, i, j);
and g6 (w6, k, l);
or g7 (w7, w1, w6);
or g8 (w8, w2, w4);
or g9 (w9, w3, w4);
nor g10 (w10, w3, w5);
nor g11 (w11, w3, w6);
and g12 (w12, w7, w8);
not g14 (w14, w10);
not g15 (w15, w11);
and g13 (w13, w9, w14, w15);
not g16 (w16, d);
not g17 (w17, e);
not g18 (w18, f);
and g19 (w19, a, w16);
and g20 (w20, a, w17);
and g21 (w19, b, w17);
and g22 (w20, b, w18);
or g23 (w23, w19, w20);
or g24 (w24, w21, w22);
and g25 (w25, w23, w24);
or g26 (o, w25, w12, w13);
endmodule


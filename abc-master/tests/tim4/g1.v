module top(o, a, b, c);
input a, b, c, d, e, f, g, h;
output o;
wire n1, n2, n3, n4, n5, n6;
nand g1(n1, a, b);
nand g2(n2, c, d);
nand g3(n3, e, f);
nand g4(n4, g, h);
nand g5(n5, n1, n2);
nand g6(n6, n3, n4);
nand g7(n7, n5, n6);
assign o = n7;
endmodule
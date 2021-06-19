module top(o, a);
output o;
input a, b, c;
wire t_0, o1; 
and g1(o1, a, b, c);
assign o = t_0;

  patch p0 ( .t_0(t_0), .a(a), .b(b), .c(c) );

endmodule


// Patch   : in = 3  out = 1 : pi_in = 3  po_out = 1 : tfi = 0  tfo = 2
// Added   : gate =   2 : c0 = 0  c1 = 0  buf =  0  inv =  0  two-input =   2

module patch ( t_0, a, b, c );

  output t_0;
  input a, b, c;
  wire ww1;

  and ( ww1, c, b );
  or ( t_0, ww1, a );

endmodule



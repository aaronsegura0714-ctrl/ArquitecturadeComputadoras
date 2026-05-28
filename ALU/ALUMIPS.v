module alumips(
input [31:0]A,
input [31:0]B,
output [31:0]RMux,
input [3:0] sel
);

wire [31:0]m1, m2, m3, m4, m5;

or32comp or1(.Oo1(A),.Oo2(B),.RO(m1));
r32comp r1(.Ro1(A),.Ro2(B),.RR(m2));
and32comp and1(.Ao1(A),.Ao2(B),.RA(m3));
s32comp s1(.So1(A),.So2(B),.RS(m4));
slt32comp slt1(.Slto1(A),.Slto2(B),.RSLT(m5));
mux5a1 mux(.suma(m1),.resta(m2),._and(m3),._or(m4),.slt(m5),.ALUctl(sel),.R(RMux));

endmodule
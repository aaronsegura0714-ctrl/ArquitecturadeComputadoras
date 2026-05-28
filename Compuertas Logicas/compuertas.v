module COMPUERTAS(
    input a,
    input b,
    output c,
    output d,
    output e,
    output f,
    output g,
    output h,
    output i
);

// AND
assign c = a & b;
// OR
assign d = a | b;
// NAND
assign e = ~(a & b);
// NOR
assign f = ~(a | b);
// NOTA
assign g = ~a;
// XOR
assign h = a ^ b;
// XNOR
assign i = ~(a ^ b);

endmodule
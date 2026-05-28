module s32comp(
input [31:0]So1,
input [31:0]So2,
output [31:0]RS
);

assign RS = So1 + So2;

endmodule

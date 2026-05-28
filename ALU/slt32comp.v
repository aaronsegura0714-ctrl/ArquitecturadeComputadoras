module slt32comp(
input [31:0]Slto1,
input [31:0]Slto2,
output [31:0]RSLT
);

assign RSLT = Slto1 < Slto2 ? 1:0;

endmodule

module and32comp(
input [31:0]Ao1,
input [31:0]Ao2,
output [31:0]RA
);

assign RA = Ao1 & Ao2;

endmodule
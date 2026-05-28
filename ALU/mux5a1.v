module mux5a1(
input [31:0] suma, resta, _or, _and, slt,
input [3:0]ALUctl,
output reg[31:0]R
);

always @(ALUctl)
	begin
	     case(ALUctl)

	     4'b0000:R=suma;
	     4'b0001:R=resta;
	     4'b0010:R=_or;
	     4'b0011:R=_and;
	     4'b0100:R=slt;
	     endcase
	end


endmodule
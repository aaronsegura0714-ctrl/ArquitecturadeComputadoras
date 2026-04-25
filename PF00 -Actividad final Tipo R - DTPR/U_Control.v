module U_Control(
	input [5:0]op,
	output reg memToReg,
	output reg memToWrite,
	output reg memToRead,
	output reg [2:0]AluOP,
	output reg RegWrite
);
always@(*)
begin 
	RegWrite = 1'b0;
	AluOP = 3'b000;
	memToRead =1'b0;
	memToWrite =1'b0;
	memToReg =1'b0;

case (op)
	6'b000000:
	begin
		RegWrite = 1'b1;
		AluOP = 3'b010;
		memToRead =1'b0;
		memToWrite =1'b0;
		memToReg =1'b0;
	end
endcase 
end
endmodule
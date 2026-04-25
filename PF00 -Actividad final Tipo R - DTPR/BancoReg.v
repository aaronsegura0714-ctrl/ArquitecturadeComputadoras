module BancoReg (
    input clk,
    input RegWrite,
    input [4:0] rs, rt, rd,
    input [31:0] writeData,
    output [31:0] readData1, readData2
);
    reg [31:0] regs [0:31];

    assign readData1 = regs[rs];
    assign readData2 = regs[rt];

    always @(posedge clk) begin
    if (RegWrite && rd != 0)
        regs[rd] <= writeData;
end

endmodule


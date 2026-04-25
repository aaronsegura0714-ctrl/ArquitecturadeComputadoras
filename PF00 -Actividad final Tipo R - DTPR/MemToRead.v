module Mem (
    input clk,
    input MemWrite,
    input [31:0] addr,
    input [31:0] write,
    output reg [31:0] read
);
    reg [31:0] memory [0:255];

    always @(*) begin
    read = memory[addr];
end

always @(posedge clk) begin
    if (MemWrite)
        memory[addr] <= write;
end

endmodule


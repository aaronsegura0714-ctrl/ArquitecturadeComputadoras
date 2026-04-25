module ALU (
    input [31:0] A, B,
    input [2:0] ALUCtrl,
    output reg [31:0] Result
);
    always @(*) begin
        case (ALUCtrl)
            3'b010: Result = A + B;          // SUMA
            3'b110: Result = A - B;          // RESTA
            3'b000: Result = A & B;          // AND
            3'b001: Result = A | B;          // OR
            3'b111: Result = (A < B) ? 1:0;  // SLT
            default: Result = 0;
        endcase
    end
endmodule


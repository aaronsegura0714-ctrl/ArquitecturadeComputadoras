module ALUControl (
    input [5:0] fnc,
    input [2:0] ALUOp,
    output reg [2:0] Sel
);
    always @(*) begin
        case (ALUOp)
            3'b010: begin
                case (fnc)
                    6'b100000: Sel = 3'b010; // Suma
                    6'b100010: Sel = 3'b110; // Resta
                    6'b100100: Sel = 3'b000; // And
                    6'b100101: Sel = 3'b001; // Or
		    6'b101010: Sel = 3'b111; // SLT
                 default:   Sel = 3'b000;
             endcase
         	end
         default: Sel = 3'b000;
    	 endcase
    end
endmodule

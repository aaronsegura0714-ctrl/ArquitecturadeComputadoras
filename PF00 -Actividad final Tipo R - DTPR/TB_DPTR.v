module TB_DPTR;
    reg clk;
    reg [31:0] instruction;
    wire [31:0] result;

    DPTR tb (
        .clk(clk),
        .instruction(instruction),
        .result(result)
    );
    initial begin
        tb.BR.regs[1] = 32'd10; 
        tb.BR.regs[2] = 32'd5;  
        tb.BR.regs[3] = 32'd0;  
    end

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Inicio de simulación");
	
	// SUMA
	instruction = {6'b000000, 5'd1, 5'd2, 5'd3, 5'd0, 6'b100000};
	#10 $display("ADD $3,$1,$2 = %d", result);

	instruction = {6'b000000, 5'd2, 5'd1, 5'd4, 5'd0, 6'b100000};
	#10 $display("ADD $4,$2,$1 = %d", result);

	// RESTA
	instruction = {6'b000000, 5'd1, 5'd2, 5'd5, 5'd0, 6'b100010};
	#10 $display("SUB $5,$1,$2 = %d", result);

	instruction = {6'b000000, 5'd2, 5'd1, 5'd6, 5'd0, 6'b100010};
	#10 $display("SUB $6,$2,$1 = %d", result);

	// AND
	instruction = {6'b000000, 5'd1, 5'd2, 5'd7, 5'd0, 6'b100100};
	#10 $display("AND $7,$1,$2 = %d", result);

	// OR
	instruction = {6'b000000, 5'd1, 5'd2, 5'd8, 5'd0, 6'b100101};
	#10 $display("OR $8,$1,$2 = %d", result);

	// SLT	
	instruction = {6'b000000, 5'd1, 5'd2, 5'd9, 5'd0, 6'b101010};
	#10 $display("SLT $9,$1,$2 = %d", result);

	instruction = {6'b000000, 5'd2, 5'd1, 5'd10, 5'd0, 6'b101010};
	#10 $display("SLT $10,$2,$1 = %d", result);


        $stop;
    end
endmodule


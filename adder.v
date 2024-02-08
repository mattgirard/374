module adder (
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] Result
);

    reg [32:0] LocalCarry; // Extra bit for carry, notice the size [32:0]
	 
    integer i;

    always @(*) // Use * for combinational logic
    begin
        LocalCarry[0] = 1'b0;
        for (i = 0; i < 32; i = i + 1) 
        begin
            Result[i] = A[i] ^ B[i] ^ LocalCarry[i];
            LocalCarry[i+1] = (A[i] & B[i]) | (LocalCarry[i] & (A[i] | B[i]));
        end
    end

endmodule

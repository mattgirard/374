module subtractor (A, B, Result);
    input [7:0] A; // Minuend
    input [7:0] B; // Subtrahend
    output reg [7:0] Result;

    reg [7:0] TwosComplementB;
    reg [8:0] LocalCarry; // Extra bit for carry
    integer i;

    // Compute two's complement of B
    always @(B) begin
        TwosComplementB = ~B + 1'b1;
    end

    // Perform binary addition of A and two's complement of B
    always @(A or TwosComplementB) begin
        LocalCarry = 9'd0;
        for (i = 0; i < 8; i = i + 1) begin
            // Add A and two's complement of B, bit by bit
            Result[i] = A[i] ^ TwosComplementB[i] ^ LocalCarry[i];
            LocalCarry[i+1] = (A[i] & TwosComplementB[i]) | (LocalCarry[i] & (A[i] | TwosComplementB[i]));
        end
        // Overflow bit is ignored for 8-bit result
    end

endmodule

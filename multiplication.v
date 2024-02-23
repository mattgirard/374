module multiplication (
    input [31:0] multiplicand,
    input [31:0] multiplier,
    output reg [63:0] product
);

// Intermediate variables
reg [63:0] A = 0, P = 0;
reg [31:0] C_add=0, C_sub=0;
integer i;

// Instantiate the adder
adder adder_inst (
    .A(P[63:32]),
    .B(A[31:0]),
    .Result(C)
);

//instantiate the subtractor
subtractor subtractor_inst (
    .A(P[63:32]),
    .B(A[31:0]),
    .Result(C)
);


initial begin
    // Initialize A, S, and P
    A[31:0] = multiplicand;
    P[31:0] = multiplier;
    P[63:32] = 0;

    // Booth's algorithm steps
    for (i = 0; i < 32; i = i + 1) begin
        // Evaluate the least significant bits of P and apply Booth's rules
        case (P[1:0])
            2'b01: P[63:32] = C_add; // Add A
            2'b10: P[63:32] = C_sub; // Add S (equivalent to subtracting A)
            default: ; // No operation for 00 and 11
        endcase
        
        // Arithmetic right shift by 1
        P = P >> 1;
        P[63] = P[62]; // Maintain sign for two's complement numbers
    end
    
    // Final product is in P
    product = P;
	 $display("Product: %d", P);

end

endmodule

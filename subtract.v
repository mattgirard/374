module subtractor (
    input [31:0] A,
    input [31:0] B,
    output [63:0] Result
);

// Intermediate wires
wire [31:0] twos_complement_B;
wire [31:0] addition_result;

// Generate the two's complement of B
assign twos_complement_B = ~B + 1'b1;

// Instantiate the adder to add A and the two's complement of B
adder adder_instance (
    .A(A),
    .B(twos_complement_B),
    .Result(addition_result)
);

// The result of the addition is the result of the subtraction
assign Result = addition_result;

endmodule

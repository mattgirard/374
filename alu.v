module alu(
    input [31:0] A, B,
    input [3:0] operation, // Control signal for selecting the operation
    output reg [31:0] C
);

// Internal wire for the result of the adder module
wire [31:0] add_result;

// Internal wire for the result of the subtractor module
wire [31:0] subtract_result;

// Internal wire for the result of the multiplier module
wire [63:0] multiply_result;


// Instantiate the adder
adder adder_inst (
    .A(A),
    .B(B),
    .Result(add_result)
);

//instantiate the subtractor
subtractor subtractor_inst (
    .A(A),
    .B(B),
    .Result(subtract_result)
);

//instantiate booth multiplier
multiplication multiply_inst (
	.multiplicand(A),
	.multiplier(B),
	.product(multiply_result)
);


always @(*)
begin

    case(operation)
        4'b00011: C = add_result; // ADD operation using the adder module
        4'b00100: C = subtract_result;      // SUB operation
        4'b01010: C = A & B;      // AND operation
        4'b01011: C = A | B;      // OR operation
		  4'b01111: C = multiply_result; // MUL operation
        4'b10000: C = A / B; // DIV operation
		  4'b10001: C =~A + 1; // Negate operation
        4'b10010: C =    ~A; // NOT operation
        4'b00110: C = A | B; // Shift Right Arithmetic operation (shra)
        4'b00101: C = A | B; // Shift Right Logical operation (shr)
		  4'b00111: C = A | B; // Shift Left Logical operation (shl)
		  4'b01001: C = A | B; // Rotate Left operation (rol)
		  4'b01000: C = A | B; // Rotate Right operation (ror)
        default: C = 32'h0;      // Default case
    endcase
end

endmodule

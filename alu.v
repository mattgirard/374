module alu(
    input [31:0] A, B,
    input [3:0] operation, // Control signal for selecting the operation
    output reg [31:0] C
);

// Internal wire for the result of the adder module
wire [31:0] add_result;

// Instantiate the adder module for the ADD operation
adder adder_inst (
    .A(A),
    .B(B),
    .Result(add_result)
);

always @(*)
begin
    case(operation)
        4'b0000: C = add_result; // ADD operation using the adder module
        4'b0001: C = A - B;      // SUB operation
        4'b0010: C = A & B;      // AND operation
        4'b0011: C = A | B;      // OR operation
		  
		  4'b01111: C = A * B; // MUL operation
        4'b10000: C = A / B; // DIV operation
		  4'b10001: C = A ^ B; // Negate operation
        4'b10010: C = A ^ B; // NOT operation
        4'b00110: C = A | B; // Shift Right Arithmetic operation
        4'b00101: C = A | B; // Shift Right Logical operation
		  4'b00111: C = A | B; // Shift Left Logical operation
		  4'b01001: C = A | B; // Rotate Left operation
		  4'b01000: C = A | B; // Rotate Right Logical operation
        default: C = 32'h0;      // Default case
    endcase
end

endmodule

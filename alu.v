module alu(
    input [31:0] A, B,
    input [3:0] operation, // Control signal for selecting the operation
    output reg [31:0] Z_lo,
	 output reg [31:0] Z_hi
	 
);

// Internal wire for the result of the adder module
wire [31:0] add_result;

// Internal wire for the result of the subtractor module
wire [31:0] subtract_result;

// Internal wire for the result of the multiplier module
wire [63:0] multiply_result;

wire [31:0] division_result;
wire [31:0] division_remainder;


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
	.X(A),
	.Y(B),
	.outputZ(multiply_result)
);

division division_inst(
	.dividend(A),
	.divisor(B),
	.quotient(division_result),
	.remainder(division_remainder)
	);

always @(*)
begin

    case(operation)
        4'b00011: Z_lo = add_result; // ADD operation using the adder module
        4'b00100: Z_lo = subtract_result;      // SUB operation
        4'b01010: Z_lo = A & B;      // AND operation
        4'b01011: Z_lo  = A | B;      // OR operation
		  4'b01111: begin Z_lo  = multiply_result[31:0]; 
						Z_hi = multiply_result[63:32]; 
						end // MUL operation
        4'b10000: Z_lo  = A / B; // DIV operation
		  4'b10001: Z_lo  = ~A + 1; // Negate operation
        4'b10010: Z_lo  = ~A; // NOT operation
        4'b00110: Z_lo  = A | B; // Shift Right Arithmetic operation (shra)
        4'b00101: Z_lo  = A | B; // Shift Right Logical operation (shr)
		  4'b00111: Z_lo  = A | B; // Shift Left Logical operation (shl)
		  4'b01001: Z_lo  = A | B; // Rotate Left operation (rol)
		  4'b01000: Z_lo  = A | B; // Rotate Right operation (ror)
        default: begin 
						Z_lo  = 32'h0; 
					  Z_hi = 32'h0 ; 
						end			  // Default case
    endcase
end

endmodule

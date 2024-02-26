module multiplication (
    input wire[31:0] multiplicand, //multiplicand,
    input wire[31:0] multiplier, //multiplier,
    output reg[63:0] product //changed from output reg
);

// Intermediate variables
reg [63:0] P;
reg [31:0] A;
wire [31:0] addition_result, subtraction_result;

integer i;

// Instantiate the adder
adder adder_inst (
    .A(partial_P),
    .B(A),
    .Result(addition_result)
);
/*adder adder_inst (
    .A(P[31:0]),
    .B(A[31:0]),
    .Result(addition_result)
);
*/

//instantiate the subtractor
subtractor subtractor_inst (
    .A(partial_P),
    .B(A),
    .Result(subtraction_result)
);


initial begin
    // Initialize A, S, and P
	 P = {32'b0, multiplier};
    A = multiplicand;   //A[31:0] = multiplicand;
	 $display("initial P: %b", P);
	 
 
    // Booth's algorithm steps
    for (i = 0; i < 32; i = i + 1) begin
		$display("Iteration %d: P[1:0] = %b", i, P[1:0]);
        // Evaluate the least significant bits of P and apply Booth's rules
        case (P[1:0])
            2'b01: P[63:32] = P[63:32] + A; // Add A 
            2'b10: P[63:32] = P[63:32] - A; // Add S (equivalent to subtracting A)
				
            default: ; // No operation for 00 and 11
        endcase
		  
		 
  
        // Arithmetic right shift by 1
        P = {P[63], P[63], P[62:1]}; 
		  $display("Iteration %d: P = %d", i, P);
       
    end
    
    // Final product is in P
	 product = P;
    
	 $display("Product: %d", P);

end


endmodule

/*module multiplication (
    input wire[31:0] multiplicand, //multiplicand,
    input wire[31:0] multiplier, //multiplier,
    output reg[63:0] product //changed from output reg
);

// Intermediate variables
reg [63:0] P;
reg [31:0] A;
wire [31:0] addition_result, subtraction_result;

integer i;



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


endmodule */
module multiplication(X, Y, outputZ);
  
    input signed [31:0] X, Y;
    output reg [63:0] outputZ; // To avoid initial blocking assignment issues
   
    reg signed [63:0] Z; // Temporary register for internal calculations
    reg [1:0] temp; // For 01 or 10 detection
    integer i;
    reg E1; // Extra bit for Booth's algorithm
   
    always @(*) begin
        Z = 64'd0; // Initialize product register Z
        Z[31:0] = X; // Place multiplicand in the lower part of Z
        E1 = 0; // Initialize extra bit
       
        for (i = 0; i < 32; i = i + 1) begin
            temp = {Z[0], E1}; // Consider LSB of Z and extra bit E1
           
            case (temp)
                2'b01: Z[63:32] = Z[63:32] + Y; // Add Y for 01
                2'b10: Z[63:32] = Z[63:32] - Y; // Subtract Y for 10
                default: ; // No operation for 00 and 11
            endcase
           
            E1 = Z[0]; // Update E1 with the LSB of Z before shift
            Z = Z >>> 1; // Arithmetic right shift of Z along with E1
        end
       
        outputZ = Z; // Assign the final product to output
    end
endmodule

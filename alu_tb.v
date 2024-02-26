module alu_tb;

// Parameters
parameter CLK_PERIOD = 10; // Clock period in ns

// Inputs
reg [31:0] A, B;
reg [4:0] operation; // Adjusted size for operation code

// Outputs 
wire [31:0] Z_lo;
wire [31:0] Z_hi;

// Instantiate the ALU module
alu alu_inst (
    .A(A),
    .B(B),
    .operation(operation),
    .Z_lo (Z_lo),
	 .Z_hi(Z_hi)
);

// Clock generation
reg clk = 0;
always #((CLK_PERIOD)/2) clk = ~clk;

// Test stimulus
initial begin
    // Test case 1: Addition (00011)
    A = 5;
    B = 3;
    operation = 5'b00011;
    #10;
    $display("Result of addition 5 + 3: %d", Z_lo);

    // Test case 2: Subtraction (00100)
    A = 10;
    B = 3;
    operation = 5'b00100;
    #10;
    $display("Result of subtraction 10 - 3: %d", Z_lo);

    // Test case 3: AND operation (01010)
    A = 12; // 1100 in binary
    B = 5;  // 0101 in binary
    operation = 5'b01010;
    #10;
    $display("Result of AND 12 & 5: %d", Z_lo);

    // Test case 4: OR operation (01011)
    A = 12; // 1100 in binary
    B = 5;  // 0101 in binary
    operation = 5'b01011;
    #10;
    $display("Result of OR 12 | 5: %d", Z_lo);

    // Test case 5: Multiplication (01111)
    A = 6;
    B = 3;
    operation = 5'b01111;
    #10;
    $display("Result of multiplication 6 * 3: %d", Z_lo);

    // Test case 6: Division (10000)
    A = 10;
    B = 2;
    operation = 5'b10000;
    #10;
    $display("Result of division 10 / 2: Quotient %d, Remainder %d", Z_lo, Z_hi);

    // Test case 7: Negate (10001)
    A = 10;
    operation = 5'b10001;
    #10;
    $display("Result of negation of 10: %d", Z_lo);

    // Test case 8: NOT operation (10010)
    A = 12; // 1100 in binary
    operation = 5'b10010;
    #10;
    $display("Result of NOT ~12: %d", Z_lo);

    // Additional test cases for shift and rotate operations
    // Note: The functionality needs to be correctly implemented in the ALU for accurate tests.
    
    // Test case 9: Shift Right Arithmetic (00110)
    A = 8; // 1000 in binary
    operation = 5'b00110;
    #10;
    $display("Result of Shift Right Arithmetic on 8: %d", Z_lo);
    
    // Test case 10: Shift Right Logical (00101)
    A = 8; // 1000 in binary
    operation = 5'b00101;
    #10;
    $display("Result of Shift Right Logical on 8: %d", Z_lo);
    
    // Test case 11: Shift Left Logical (00111)
    A = 1; // 0001 in binary
    operation = 5'b00111;
    #10;
    $display("Result of Shift Left Logical on 1: %d", Z_lo);
    
    // Test case 12: Rotate Left (01001)
    A = 128; // 10000000 in binary
    operation = 5'b01001;
    #10;
    $display("Result of Rotate Left on 128: %d", Z_lo);
    
    // Test case 13: Rotate Right (01000)
    A = 1; // 0001 in binary
    operation = 5'b01000;
    #10;
    $display("Result of Rotate Right on 1: %d", Z_lo);

end

endmodule
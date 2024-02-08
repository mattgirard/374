module alu_tb;

// Parameters
parameter CLK_PERIOD = 10; // Clock period in ns

// Inputs
reg [31:0] A, B;
reg [3:0] operation;

// Outputs
wire [31:0] C;

// Instantiate the ALU module
alu alu_inst (
    .A(A),
    .B(B),
    .operation(operation),
    .C(C)
);

// Clock generation
reg clk = 0;
always #((CLK_PERIOD)/2) clk = ~clk;

// Test stimulus
initial begin
    // Test case 1: Addition (0000)
    A = 5;
    B = 3;
    operation = 4'b0000;
    #10; // Wait for 10 time units
    $display("Result of addition: %d", C);

    // Test case 2: Subtraction (0001)
    A = 8;
    B = 4;
    operation = 4'b0001;
    #10; // Wait for 10 time units
    $display("Result of subtraction: %d", C);

    // Test case 3: Logical AND (0010)
    A = 6;
    B = 3;
    operation = 4'b0010;
    #10; // Wait for 10 time units
    $display("Result of logical AND: %d", C);

    // Add more test cases for other operations as needed
end

endmodule
module program_counter
#(
    parameter DATA_WIDTH = 32,
    parameter INIT = 32'h0
)
(
    input wire clear,         // Asynchronous clear signal
    input wire clock,         // Clock signal
    input wire enable,        // Enable signal
    input wire inc_PC,        // Increment signal
    output reg [DATA_WIDTH-1:0] pc_out // Program counter output
);

reg [DATA_WIDTH-1:0] pc_reg;

// Initialization should be done inside an initial block
initial pc_reg = INIT;

always @(posedge clock or posedge clear) begin
    // Clear the program counter if the clear signal is asserted
    if (clear) begin
        pc_reg <= INIT;
    end
    // Increment the program counter if enable signal is high and inc_pc signal is asserted
    else if (enable && inc_PC) begin
        pc_reg <= pc_reg + 1;
    end
end

// Output assignment
assign pc_out = pc_reg;

endmodule

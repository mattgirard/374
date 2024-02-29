module PC_Register #(
    parameter DATA_WIDTH = 32,  // Typically, PC width matches the address space
    parameter INIT = 32'h00000000  // Default start address
)(
    input wire clock,
    input wire clear,
    input wire enable,
    input wire inc,  // Increment signal
    input wire [DATA_WIDTH-1:0] BusMuxOut,  // For loading specific address
    output wire [DATA_WIDTH-1:0] BusMuxIn  // PC value
);

reg [DATA_WIDTH-1:0] q;
initial q = INIT;

always @(posedge clock) begin
    if (clear) begin
        q <= INIT;  // Reset to initial address
    end 
    else if (enable) begin
        q <= BusMuxOut;  // Load a new address
    end 
    else if (inc) begin
        q <= q + 1;  // Increment PC to point to the next instruction
    end
end

assign BusMuxIn = q;

endmodule

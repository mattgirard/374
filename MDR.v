module MDR (
    input clk,
    input clr,
    input enable,
    input read,
    input [31:0] BusMuxOut,
    input [31:0] Mdatain,
    output [31:0] Q
);

// Assuming your generic register module is named 'register' and has parameters
// for data width and initial value. If it does not have such parameters, remove them.
wire [31:0] MDMuxOut;

// Instantiate your generic register module here
register #(32, 32'h0) MDR_register (
    .clear(clr),
    .clock(clk),
    .enable(enable),
    .BusMuxOut(MDMuxOut),
    .BusMuxIn(Q)
);

// Multiplexer logic to select between BusMuxOut and Mdatain
assign MDMuxOut = read ? Mdatain : BusMuxOut;

endmodule

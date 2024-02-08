// in mini_src.v 

// Instantiate the Memory Data Register (MDR)
memory_data_register mdr (
    .clear(clear),          // Clear signal
    .clock(clock),          // Clock signal
    .Mdatain(Mdatain),      // Input from memory unit
    .BusMuxOut(BusMuxOut),  // Input from bus
    .MDRin(MDRin),          // Control signal to enable writing to MDR
    .memory_out(memory_out),// Output to memory chip
    .BusMuxIn(BusMuxIn)     // Output to bus
);


//Wire to connect MDR output to bus multiplexer input

wire [31:0] MDR_BusMuxIn; 




// in its own file 

module memory_data_register(
    input clear, clock,
    input [31:0] Mdatain, // Input from memory unit
    input [31:0] BusMuxOut, // Input from bus
    input MDRin, // Control signal to enable writing to MDR
    output reg [31:0] memory_out, // Output to memory chip
    output reg [31:0] BusMuxIn // Output to bus
);

reg [31:0] mdr_data;

always @(posedge clock or posedge clear)
begin
    if(clear)
        mdr_data <= 32'h0; // Clear the MDR when clear signal is asserted
    else if(clock and MDRin)
        mdr_data <= Mdatain; // Load data from memory unit when clock signal rises and MDRin is asserted
    else if(clock and !MDRin)
        mdr_data <= BusMuxOut; // Load data from bus when clock signal rises and MDRin is not asserted
end

always @(posedge clock)
begin
    if(MDRin)
        memory_out <= mdr_data; // Write data from MDR to memory chip when MDRin is asserted
    else
        memory_out <= 32'hz; // Output high impedance when MDRin is not asserted
    BusMuxIn <= mdr_data; // Output data stored in the MDR to the bus
end

endmodule

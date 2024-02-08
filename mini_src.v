// Top-level module for the Simple RISC Computer (Mini SRC)
module mini_src(
    input clear, clock,
	 output [31:0] BusMuxOut
    // ... other inputs like control signals, data inputs, etc.
);

//pc input, output and enable
wire [31:0] pc_output;
wire [31:0] pc_input;
wire pc_enable;

//ir input, output and enable
wire [31:0] ir_output;
wire [31:0] ir_input;
wire ir_enable;

// GP inputs, outputs, and enable declarations
wire [31:0] gp_output0, gp_output1, gp_output2, gp_output3,
            gp_output4, gp_output5, gp_output6, gp_output7,
            gp_output8, gp_output9, gp_output10, gp_output11,
            gp_output12, gp_output13, gp_output14, gp_output15;

wire [31:0] gp_input0, gp_input1, gp_input2, gp_input3,
            gp_input4, gp_input5, gp_input6, gp_input7,
            gp_input8, gp_input9, gp_input10, gp_input11,
            gp_input12, gp_input13, gp_input14, gp_input15;
				
wire gp_enable0, gp_enable1, gp_enable2, gp_enable3,
     gp_enable4, gp_enable5, gp_enable6, gp_enable7,
     gp_enable8, gp_enable9, gp_enable10, gp_enable11,
     gp_enable12, gp_enable13, gp_enable14, gp_enable15;
	  
wire [3:0] gp_register_select;



// Instantiate the Program Counter (PC) register
register #(32, 32, 32'h0) pc_register (
  .clear(clear),.clock(clock),.enable(pc_enable),.BusMuxOut(pc_input),.BusMuxIn(pc_output)
);

// Instantiate the Instruction Register (IR)
register #(32, 32, 32'h0) ir_register (
  .clear(clear), .clock(clock), .enable(ir_enable), .BusMuxOut(ir_input), .BusMuxIn(ir_output)
);

// Instantiate the General-Purpose Registers (R0 to R15)
register #(32, 32, 32'h0) gp_register0 (
    .clear(clear), .clock(clock), .enable(gp_enable0), .BusMuxOut(gp_input0), .BusMuxIn(gp_output0)
);

register #(32, 32, 32'h0) gp_register1 (
    .clear(clear), .clock(clock), .enable(gp_enable1), .BusMuxOut(gp_input1), .BusMuxIn(gp_output1)
);

register #(32, 32, 32'h0) gp_register2 (
    .clear(clear), .clock(clock), .enable(gp_enable2), .BusMuxOut(gp_input2), .BusMuxIn(gp_output2)
);

register #(32, 32, 32'h0) gp_register3 (
    .clear(clear), .clock(clock), .enable(gp_enable3), .BusMuxOut(gp_input3), .BusMuxIn(gp_output3)
);

register #(32, 32, 32'h0) gp_register4 (
    .clear(clear), .clock(clock), .enable(gp_enable4), .BusMuxOut(gp_input4), .BusMuxIn(gp_output4)
);

register #(32, 32, 32'h0) gp_register5 (
    .clear(clear), .clock(clock), .enable(gp_enable5), .BusMuxOut(gp_input5), .BusMuxIn(gp_output5)
);

register #(32, 32, 32'h0) gp_register6 (
    .clear(clear), .clock(clock), .enable(gp_enable5), .BusMuxOut(gp_input5), .BusMuxIn(gp_output5)
);

register #(32, 32, 32'h0) gp_register7 (
    .clear(clear), .clock(clock), .enable(gp_enable5), .BusMuxOut(gp_input5), .BusMuxIn(gp_output5)
);

register #(32, 32, 32'h0) gp_register8 (
    .clear(clear), .clock(clock), .enable(gp_enable5), .BusMuxOut(gp_input5), .BusMuxIn(gp_output5)
);

register #(32, 32, 32'h0) gp_register9 (
    .clear(clear), .clock(clock), .enable(gp_enable5), .BusMuxOut(gp_input5), .BusMuxIn(gp_output5)
);

register #(32, 32, 32'h0) gp_register10 (
    .clear(clear), .clock(clock), .enable(gp_enable5), .BusMuxOut(gp_input5), .BusMuxIn(gp_output5)
);

register #(32, 32, 32'h0) gp_register11 (
    .clear(clear), .clock(clock), .enable(gp_enable5), .BusMuxOut(gp_input5), .BusMuxIn(gp_output5)
);

register #(32, 32, 32'h0) gp_register12 (
    .clear(clear), .clock(clock), .enable(gp_enable5), .BusMuxOut(gp_input5), .BusMuxIn(gp_output5)
);

register #(32, 32, 32'h0) gp_register13 (
    .clear(clear), .clock(clock), .enable(gp_enable5), .BusMuxOut(gp_input5), .BusMuxIn(gp_output5)
);

register #(32, 32, 32'h0) gp_register14 (
    .clear(clear), .clock(clock), .enable(gp_enable5), .BusMuxOut(gp_input5), .BusMuxIn(gp_output5)
);
register #(32, 32, 32'h0) gp_register15 (
    .clear(clear), .clock(clock), .enable(gp_enable5), .BusMuxOut(gp_input5), .BusMuxIn(gp_output5)
);

// Instantiate the Bus module
Bus bus_instance (
    .gp_output0(gp_output0),
    .gp_output1(gp_output1),
    .gp_output2(gp_output2),
    .gp_output3(gp_output3),
    .gp_output4(gp_output4),
    .gp_output5(gp_output5),
    .gp_output6(gp_output6),
    .gp_output7(gp_output7),
    .gp_output8(gp_output8),
    .gp_output9(gp_output9),
    .gp_output10(gp_output10),
    .gp_output11(gp_output11),
    .gp_output12(gp_output12),
    .gp_output13(gp_output13),
    .gp_output14(gp_output14),
    .gp_output15(gp_output15),
    .gp_register_select(gp_register_select), // This needs to be driven by some control logic within mini_src
    .BusMuxOut(BusMuxOut_main) // Connect the output of the bus to wherever it's needed within mini_src
);
    // ... instantiate other registers like HI, LO, SP, RA, etc.

endmodule

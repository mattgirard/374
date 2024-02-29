// Top-level module for the Simple RISC Computer (Mini SRC)
module DataPath(
    input PCout, Zloout, MDRout, R2out, R3out, //control signals for outputting data from registers
    input MAR_in, Z_in, PC_in, MDR_in, IR_in, Y_in, //control signals for inputting data to registers
    input IncPC, Read, 
	 input [3:0] opcode,
	 input R1_in, R2_in, R3_in,
    input Clock,
    input [31:0] Mdatain
);
//bus wires
wire [31:0] BusMuxOut;
wire [32:0] inport_enable, c_enable, inport_output, c_output;

//pc input, output and enable
wire [31:0] PC_output;
wire [31:0] PC_input;
wire PCin;

//ir input, output and enable
wire [31:0] IR_out;
wire IR_enable;

//MAR input, output and enable
wire [31:0] MAR_out;
wire MAR_enable;

//Z input, output and enable
wire [63:0] Z_out;
wire Zhi_enable;
wire Zlo_enable;

//Y input, output and enable
wire [31:0] Y_out;
wire Y_enable;

//HI input, output and enable
wire [31:0] HI_out;
wire HI_enable;

//LO input, output and enable
wire [31:0] LO_out;
wire LO_enable;

//MDR input, output, enable, read and Mdatain
wire [31:0] MDR_out;
wire MDR_enable;

// GP inputs, outputs, and enable declarations
wire [31:0] gp_output0, gp_output1, gp_output2, gp_output3,
            gp_output4, gp_output5, gp_output6, gp_output7,
            gp_output8, gp_output9, gp_output10, gp_output11,
            gp_output12, gp_output13, gp_output14, gp_output15;
				
wire gpin0, gpin1, gpin2, gpin3,
     gpin4, gpin5, gpin6, gpin7,
     gpin8, gpin9, gpin10, gpin11,
     gpin12, gpin13, gpin14, gpin15;
	  

//Instantiate the Memory Data Register (MDR)
MDR MDR(.clk(clock), .clr(clear), .enable(MDR_in),.read(Read),
	.BusMuxOut(BusMuxout),.Mdatain(Mdatain),.Q(MDR_out)
);

// Instantiate the Program Counter (PC) register
PC_Register #(32, 32'h00000000) PC_register (
  .clear(clear),.clock(clock),.enable(PC_in), .inc(IncPC), .BusMuxOut(BusMuxout),.BusMuxIn(PC_out)
);

// Instantiate the Instruction Register (IR)
register #(32, 32, 32'h00000000) IR_register (
  .clear(clear), .clock(clock), .enable(IR_in), .BusMuxOut(BusMuxout), .BusMuxIn(IR_out)
);

// Instantiate the Y Register
register #(32, 32, 32'h00000000) Y_register (
  .clear(clear), .clock(clock), .enable(Y_in), .BusMuxOut(BusMuxout), .BusMuxIn(Y_out)
);

// Instantiate the Z Register
register #(64, 64, 64'h0) Z_register (
  .clear(clear), .clock(clock), .enable(Z_in), .BusMuxOut(BusMuxout), .BusMuxIn(Z_out)
);


// Instantiate the MAR Register
register #(32, 32, 32'h00000000) MAR_register (
  .clear(clear), .clock(clock), .enable(MAR_in), .BusMuxOut(BusMuxout), .BusMuxIn(MAR_out)
);


// Instantiate the HI Register
register #(32, 32, 32'h00000000) HI_register (
  .clear(clear), .clock(clock), .enable(HI_enable), .BusMuxOut(BusMuxout), .BusMuxIn(HI_out)
);


// Instantiate the LO Register
register #(32, 32, 32'h00000000) LO_register (
  .clear(clear), .clock(clock), .enable(LO_enable), .BusMuxOut(BusMuxout), .BusMuxIn(LO_out)
);

// Instantiate the General-Purpose Registers (R0 to R15)
register #(32, 32, 32'h00000000) gp_register0 (
    .clear(clear), .clock(clock), .enable(gp_enable0), .BusMuxOut(BusMuxout), .BusMuxIn(gp_out0)
);

register #(32, 32, 32'h00000000) gp_register1 (
    .clear(clear), .clock(clock), .enable(R1_in), .BusMuxOut(BusMuxout), .BusMuxIn(gp_out1)
);

register #(32, 32, 32'h00000000) gp_register2 (
    .clear(clear), .clock(clock), .enable(R2_in), .BusMuxOut(BusMuxout), .BusMuxIn(gp_out2)
);

register #(32, 32, 32'h00000000) gp_register3 (
    .clear(clear), .clock(clock), .enable(R3_in), .BusMuxOut(BusMuxout), .BusMuxIn(gp_out3)
);

register #(32, 32, 32'h00000000) gp_register4 (
    .clear(clear), .clock(clock), .enable(gp_enable4), .BusMuxOut(BusMuxout), .BusMuxIn(gp_out4)
);

register #(32, 32, 32'h00000000) gp_register5 (
    .clear(clear), .clock(clock), .enable(gp_enable5), .BusMuxOut(BusMuxout), .BusMuxIn(gp_out5)
);

register #(32, 32, 32'h00000000) gp_register6 (
    .clear(clear), .clock(clock), .enable(gp_enable6), .BusMuxOut(BusMuxout), .BusMuxIn(gp_out6)
);

register #(32, 32, 32'h00000000) gp_register7 (
    .clear(clear), .clock(clock), .enable(gp_enable7), .BusMuxOut(BusMuxout), .BusMuxIn(gp_out7)
);

register #(32, 32, 32'h00000000) gp_register8 (
    .clear(clear), .clock(clock), .enable(gp_enable8), .BusMuxOut(BusMuxout), .BusMuxIn(gp_out8)
);

register #(32, 32, 32'h00000000) gp_register9 (
    .clear(clear), .clock(clock), .enable(gp_enable9), .BusMuxOut(BusMuxout), .BusMuxIn(gp_out9)
);

register #(32, 32, 32'h00000000) gp_register10 (
    .clear(clear), .clock(clock), .enable(gp_enable10), .BusMuxOut(BusMuxout), .BusMuxIn(gp_out10)
);

register #(32, 32, 32'h00000000) gp_register11 (
    .clear(clear), .clock(clock), .enable(gp_enable11), .BusMuxOut(BusMuxout), .BusMuxIn(gp_out11)
);

register #(32, 32, 32'h00000000) gp_register12 (
    .clear(clear), .clock(clock), .enable(gp_enable12), .BusMuxOut(BusMuxout), .BusMuxIn(gp_out12)
);

register #(32, 32, 32'h00000000) gp_register13 (
    .clear(clear), .clock(clock), .enable(gp_enable13), .BusMuxOut(BusMuxout), .BusMuxIn(gp_out13)
);

register #(32, 32, 32'h00000000) gp_register14 (
    .clear(clear), .clock(clock), .enable(gp_enable14), .BusMuxOut(BusMuxout), .BusMuxIn(gp_out14)
);
register #(32, 32, 32'h00000000) gp_register15 (
    .clear(clear), .clock(clock), .enable(gp_enable15), .BusMuxOut(BusMuxout), .BusMuxIn(gp_out15)
);

// Instantiate the Bus module
Bus bus_instance (
    .gp_output0(gp_out0),
    .gp_output1(gp_out1),
    .gp_output2(gp_out2),
    .gp_output3(gp_out3),
    .gp_output4(gp_out4),
    .gp_output5(gp_out5),
    .gp_output6(gp_out6),
    .gp_output7(gp_out7),
    .gp_output8(gp_out8),
    .gp_output9(gp_out9),
    .gp_output10(gp_out10),
    .gp_output11(gp_out11),
    .gp_output12(gp_out12),
    .gp_output13(gp_out13),
    .gp_output14(gp_out14),
    .gp_output15(gp_out15),
	 .hi_output(HI_out),
	 .lo_output(LO_out),
	 .zhi_output(Z_out[63:32]),
	 .zlo_output(Z_out[31:0]),
	 .pc_output(PC_out),
	 .mdr_output(MDR_out),
	 .inport_output(inport_output),
	 .c_output(c_output),
	 
	 .gp_enable0(gp_enable0),
	 .gp_enable1(gp_enable1),
	 .gp_enable2(R2out),
	 .gp_enable3(R3out),
	 .gp_enable4(gp_enable4),
	 .gp_enable5(gp_enable5),
	 .gp_enable6(gp_enable6),
	 .gp_enable7(gp_enable7),
	 .gp_enable8(gp_enable8),
	 .gp_enable9(gp_enable9),
	 .gp_enable10(gp_enable10),
	 .gp_enable11(gp_enable11),
	 .gp_enable12(gp_enable12),
	 .gp_enable13(gp_enable13),
	 .gp_enable14(gp_enable14),
	 .gp_enable15(gp_enable15),
	 .hi_enable(HI_enable),
	 .lo_enable(LO_enable),
	 .zhi_enable(Zhiout),
	 .zlo_enable(Zloout),
	 .pc_enable(PCout),
	 .mdr_enable(MDRout),
	 .inport_enable(inport_enable),
	 .c_enable(c_enable),
	 
	 .BusMuxOut(BusMuxout)
);

alu alu_instance(
	.A(gp_out1),
	.B(gp_out2),
	.operation(opcode),
	.Z_lo(Z_out[31:0]),
	.Z_hi(Z_out[63:32])
);
endmodule

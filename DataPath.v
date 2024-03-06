// Top-level module for the Simple RISC Computer (Mini SRC)
module DataPath(
    input PCout, Zloout, MDRout, R2out, R3out, //control signals for outputting data from registers
    input MAR_in, Z_in, PCin, MDR_in, IR_in, Y_in, //control signals for inputting data to registers
    input IncPC, Read, 
	 input [3:0] opcode,
	 input R1_in, R2_in, R3_in,
    input Clock,
    input [31:0] Mdatain
);
//bus wires
wire [31:0] BusMuxOut;
wire [31:0] inport_output, c_output;
wire inport_enable, c_enable;

//pc input, output and enable
wire [31:0] PC_out;
wire [31:0] PC_input;

//ir input, output and enable
wire [31:0] IR_out;
wire IR_enable;

//MAR input, output and enable
wire [31:0] MAR_out;
wire MAR_enable;

//Z input, output and enable
wire [31:0] zlo_out;
wire [31:0] zhi_out;
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
	.BusMuxOut(BusMuxOut),.Mdatain(Mdatain),.Q(MDR_out)
);

// Instantiate the Program Counter (PC) register
PC_Register PC_register (
  .clear(clear),.clock(clock),.enable(PC_in), .inc(IncPC), .BusMuxOut(BusMuxOut),.BusMuxIn(PC_out)
);

// Instantiate the Instruction Register (IR)
register32 IR_register (
  .clear(clear), .clock(clock), .enable(IR_in), .BusMuxOut(BusMuxOut), .BusMuxIn(IR_out)
);

// Instantiate the Y Register
register32 Y_register (
  .clear(clear), .clock(clock), .enable(Y_in), .BusMuxOut(BusMuxOut), .BusMuxIn(Y_out)
);

// Instantiate the Z Register
register32 Zlo_register (
  .clear(clear), .clock(clock), .enable(Z_in), .BusMuxOut(BusMuxOut), .BusMuxIn(zlo_out)
);
register32 Zhi_register (
  .clear(clear), .clock(clock), .enable(Z_in), .BusMuxOut(BusMuxOut), .BusMuxIn(zhi_out)
);


// Instantiate the MAR Register
register32 MAR_register (
  .clear(clear), .clock(clock), .enable(MAR_in), .BusMuxOut(BusMuxOut), .BusMuxIn(MAR_out)
);


// Instantiate the HI Register
register32 HI_register (
  .clear(clear), .clock(clock), .enable(HI_enable), .BusMuxOut(BusMuxOut), .BusMuxIn(HI_out)
);


// Instantiate the LO Register
register32 LO_register (
  .clear(clear), .clock(clock), .enable(LO_enable), .BusMuxOut(BusMuxOut), .BusMuxIn(LO_out)
);

// Instantiate the General-Purpose Registers (R0 to R15)
register32 gp_register0 (
    .clear(clear), .clock(clock), .enable(gp_enable0), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output0)
);

register32 gp_register1 (
    .clear(clear), .clock(clock), .enable(R1_in), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output1)
);

register32 gp_register2 (
    .clear(clear), .clock(clock), .enable(R2_in), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output2)
);

register32 gp_register3 (
    .clear(clear), .clock(clock), .enable(R3_in), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output3)
);

register32 gp_register4 (
    .clear(clear), .clock(clock), .enable(gp_enable4), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output4)
);

register32 gp_register5 (
    .clear(clear), .clock(clock), .enable(gp_enable5), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output5)
);

register32 gp_register6 (
    .clear(clear), .clock(clock), .enable(gp_enable6), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output6)
);

register32 gp_register7 (
    .clear(clear), .clock(clock), .enable(gp_enable7), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output7)
);

register32 gp_register8 (
    .clear(clear), .clock(clock), .enable(gp_enable8), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output8)
);

register32 gp_register9 (
    .clear(clear), .clock(clock), .enable(gp_enable9), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output9)
);

register32 gp_register10 (
    .clear(clear), .clock(clock), .enable(gp_enable10), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output10)
);

register32 gp_register11 (
    .clear(clear), .clock(clock), .enable(gp_enable11), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output11)
);

register32 gp_register12 (
    .clear(clear), .clock(clock), .enable(gp_enable12), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output12)
);

register32 gp_register13 (
    .clear(clear), .clock(clock), .enable(gp_enable13), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output13)
);

register32 gp_register14 (
    .clear(clear), .clock(clock), .enable(gp_enable14), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output14)
);
register32 gp_register15 (
    .clear(clear), .clock(clock), .enable(gp_enable15), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output15)
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
	 .hi_output(HI_out),
	 .lo_output(LO_out),
	 .zhi_output(zlo_out),
	 .zlo_output(zhi_out),
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
	 
	 .BusMuxOut(BusMuxOut)
);

alu alu_instance(
	.A(gp_output2),
	.B(gp_output3),
	.operation(opcode),
	.Z_lo(zlo_out),
	.Z_hi(zhi_out)
);
endmodule

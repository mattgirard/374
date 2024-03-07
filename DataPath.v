// Top-level module for the Simple RISC Computer (Mini SRC)
module DataPath(
    input PCout, Zloout, MDRout, R2out, R3out, //control signals for outputting data from registers
    input MAR_in, Z_in, PC_in, MDR_in, IR_in, Y_in, //control signals for inputting data to registers
    input IncPC, Read, 
	 input [3:0] opcode,
	 input R1in, R2_in, R3_in,
    input clock,
    input [31:0] Mdatain
);
//bus wires
wire [31:0] BusMuxOut;
wire [31:0] inport_output, c_output;
wire inport_out, c_out;

//random wires
wire clear;

//pc input, output and enable
wire [31:0] PC_output;

//ir input, output and enable
wire [31:0] IR_output;
wire IR_out;

//MAR input, output and out
wire [31:0] MAR_output;
wire MAR_out;

//Z input, output and out
wire [31:0] zlo_output;
wire [31:0] zhi_output;
wire zhi_out;

//Y input, output and out
wire [31:0] Y_output;
wire Y_out;

//HI input, output and out
wire [31:0] HI_output;
wire HI_out;
wire HI_in;

//LO input, output and out
wire [31:0] LO_output;
wire LO_out;
wire LO_in;

//MDR input, output, out, read and Mdatain
wire [31:0] MDR_output;
wire MDR_out;

// GP inputs, outputs, and out declarations
wire [31:0] gp_output0, gp_output1, gp_output2, gp_output3,
            gp_output4, gp_output5, gp_output6, gp_output7,
            gp_output8, gp_output9, gp_output10, gp_output11,
            gp_output12, gp_output13, gp_output14, gp_output15;
				
wire R0_in,
     R4_in, R5_in, R6_in, R7_in,
     R8_in, R9_in, R10_in, R11_in,
     R12_in, R13_in, R14_in, R15_in;
	  
wire gp_out0, gp_out1, gp_out2, gp_out3,
            gp_out4, gp_out5, gp_out6, gp_out7,
            gp_out8, gp_out9, gp_out10, gp_out11,
            gp_out12, gp_out13, gp_out14, gp_out15;	  

//Instantiate the Memory Data Register (MDR)
MDR MDR(.clk(clock), .clr(clear), .enable(MDR_in),.read(Read),
	.BusMuxOut(BusMuxOut),.Mdatain(Mdatain),.Q(MDR_output)
);

// Instantiate the Program Counter (PC) register
PC_Register PC_register (
  .clear(clear),.clock(clock),.enable(PC_in), .inc(IncPC), .BusMuxOut(BusMuxOut),.BusMuxIn(PC_output)
);

// Instantiate the Instruction Register (IR)
register32 IR_register (
  .clear(clear), .clock(clock), .enable(IR_in), .BusMuxOut(BusMuxOut), .BusMuxIn(IR_output)
);

// Instantiate the Y Register
register32 Y_register (
  .clear(clear), .clock(clock), .enable(Y_in), .BusMuxOut(BusMuxOut), .BusMuxIn(Y_output)
);

// Instantiate the Z Register
register32 Zlo_register (
  .clear(clear), .clock(clock), .enable(Z_in), .BusMuxOut(BusMuxOut), .BusMuxIn(zlo_output)
);
register32 Zhi_register (
  .clear(clear), .clock(clock), .enable(Z_in), .BusMuxOut(BusMuxOut), .BusMuxIn(zhi_output)
);


// Instantiate the MAR Register
register32 MAR_register (
  .clear(clear), .clock(clock), .enable(MAR_in), .BusMuxOut(BusMuxOut), .BusMuxIn(MAR_output)
);


// Instantiate the HI Register
register32 HI_register (
  .clear(clear), .clock(clock), .enable(HI_in), .BusMuxOut(BusMuxOut), .BusMuxIn(HI_output)
);


// Instantiate the LO Register
register32 LO_register (
  .clear(clear), .clock(clock), .enable(LO_in), .BusMuxOut(BusMuxOut), .BusMuxIn(LO_output)
);

// Instantiate the General-Purpose Registers (R0 to R15)
register32 gp_register0 (
    .clear(clear), .clock(clock), .enable(R0_in), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output0)
);

register32 gp_register1 (
    .clear(clear), .clock(clock), .enable(R1in), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output1)
);

register32 gp_register2 (
    .clear(clear), .clock(clock), .enable(R2_in), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output2)
);

register32 gp_register3 (
    .clear(clear), .clock(clock), .enable(R3_in), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output3)
);

register32 gp_register4 (
    .clear(clear), .clock(clock), .enable(R4_in), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output4)
);

register32 gp_register5 (
    .clear(clear), .clock(clock), .enable(R5_in), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output5)
);

register32 gp_register6 (
    .clear(clear), .clock(clock), .enable(R6_in), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output6)
);

register32 gp_register7 (
    .clear(clear), .clock(clock), .enable(R7_in), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output7)
);

register32 gp_register8 (
    .clear(clear), .clock(clock), .enable(R8_in), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output8)
);

register32 gp_register9 (
    .clear(clear), .clock(clock), .enable(R9_in), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output9)
);

register32 gp_register10 (
    .clear(clear), .clock(clock), .enable(R10_in), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output10)
);

register32 gp_register11 (
    .clear(clear), .clock(clock), .enable(R11_in), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output11)
);

register32 gp_register12 (
    .clear(clear), .clock(clock), .enable(R12_in), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output12)
);

register32 gp_register13 (
    .clear(clear), .clock(clock), .enable(R13_in), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output13)
);

register32 gp_register14 (
    .clear(clear), .clock(clock), .enable(R14_in), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output14)
);
register32 gp_register15 (
    .clear(clear), .clock(clock), .enable(R15_in), .BusMuxOut(BusMuxOut), .BusMuxIn(gp_output15)
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
	 .hi_output(HI_output),
	 .lo_output(LO_output),
	 .zhi_output(zlo_output),
	 .zlo_output(zhi_output),
	 .pc_output(PC_output),
	 .mdr_output(MDR_output),
	 .inport_output(inport_output),
	 .c_output(c_output),
	 
	 .gp_out0(gp_out0),
	 .gp_out1(gp_out1),
	 .gp_out2(R2out),
	 .gp_out3(R3out),
	 .gp_out4(gp_out4),
	 .gp_out5(gp_out5),
	 .gp_out6(gp_out6),
	 .gp_out7(gp_out7),
	 .gp_out8(gp_out8),
	 .gp_out9(gp_out9),
	 .gp_out10(gp_out10),
	 .gp_out11(gp_out11),
	 .gp_out12(gp_out12),
	 .gp_out13(gp_out13),
	 .gp_out14(gp_out14),
	 .gp_out15(gp_out15),
	 .hi_out(HI_out),
	 .lo_out(LO_out),
	 .zhi_out(zhi_out),
	 .zlo_out(Zloout),
	 .pc_out(PCout),
	 .mdr_out(MDRout),
	 .inport_out(inport_out),
	 .c_out(c_out),
	 
	 .BusMuxOut(BusMuxOut)
);

alu alu_instance(
	.A(Y_output),
	.B(busMuxout),
	.operation(opcode),
	.Z_lo(zloout),
	.Z_hi(zhi_out)
);
endmodule

// Top-level module for the Simple RISC Computer (Mini SRC)
module DataPath(
    input PCout, Zlowout, MDRout, R2out, R3out, //control signals for outputting data from registers
    input MARin, Zin, PCin, MDRin, IRin, Yin, //control signals for inputting data to registers
    input IncPC, Read, AND, R1in, R2in, R3in,
    input Clock,
    input [31:0] Mdatain
    input clear,
	 output [31:0] BusMuxOut
    // ... other inputs like control signals, data inputs, etc.
);

//pc input, output and enable
wire [31:0] PC_out;
wire [31:0] PC_in;
wire PC_enable;

//ir input, output and enable
wire [31:0] IR_out;
wire [31:0] IR_in;
wire IR_enable;

//MAR input, output and enable
wire [31:0] MAR_out;
wire [31:0] MAR_in;
wire MAR_enable;

//Z input, output and enable
wire [31:0] Z_out;
wire [31:0] Z_in;
wire Zhi_enable;
wire Zlo_enable;

//Y input, output and enable
wire [31:0] Y_out;
wire [31:0] Y_in;
wire Y_enable;

//HI input, output and enable
wire [31:0] HI_out;
wire [31:0] HI_in;
wire HI_enable;

//LO input, output and enable
wire [31:0] LO_out;
wire [31:0] LO_in;
wire LO_enable;

//MDR input, output, enable, read and Mdatain
wire [31:0] MDR_out;
wire [31:0] MDR_in;
wire [31:0] MDatain;
wire MDR_enable;
wire MDR_read;

// GP inputs, outputs, and enable declarations
wire [31:0] gp_out0, gp_out1, gp_out2, gp_out3,
            gp_out4, gp_out5, gp_out6, gp_out7,
            gp_out8, gp_out9, gp_out10, gp_out11,
            gp_out12, gp_out13, gp_out14, gp_out15;

wire [31:0] gp_in0, gp_in1, gp_in2, gp_in3,
            gp_in4, gp_in5, gp_in6, gp_in7,
            gp_in8, gp_in9, gp_in10, gp_in11,
            gp_in12, gp_in13, gp_in14, gp_in15;
				
wire gp_enable0, gp_enable1, gp_enable2, gp_enable3,
     gp_enable4, gp_enable5, gp_enable6, gp_enable7,
     gp_enable8, gp_enable9, gp_enable10, gp_enable11,
     gp_enable12, gp_enable13, gp_enable14, gp_enable15;
	  
wire [3:0] gp_register_select;

//Instantiate the Memory Data Register (MDR)
MDR MDR(.clk(clock), .clr(clear), .enable(MDR_enable),.read(MDR_read),
	.BusMuxOut(MDR_in),.Mdatain(Mdatain),.Q(MDR_out)
);

// Instantiate the Program Counter (PC) register
register #(32, 32, 32'h0) PC_register (
  .clear(clear),.clock(clock),.enable(PC_enable),.BusMuxOut(PC_in),.BusMuxIn(PC_out)
);

// Instantiate the Instruction Register (IR)
register #(32, 32, 32'h0) IR_register (
  .clear(clear), .clock(clock), .enable(IR_enable), .BusMuxOut(IR_in), .BusMuxIn(IR_out)
);

// Instantiate the Y Register
register #(32, 32, 32'h0) Y_register (
  .clear(clear), .clock(clock), .enable(Y_enable), .BusMuxOut(Y_in), .BusMuxIn(Y_out)
);

// Instantiate the Z Register
register #(64, 64, 64'h0) Z_register (
  .clear(clear), .clock(clock), .enable(Z_enable), .BusMuxOut(Z_in), .BusMuxIn(Z_out)
);


// Instantiate the MAR Register
register #(32, 32, 32'h0) MAR_register (
  .clear(clear), .clock(clock), .enable(MAR_enable), .BusMuxOut(MAR_in), .BusMuxIn(MAR_out)
);


// Instantiate the HI Register
register #(32, 32, 32'h0) HI_register (
  .clear(clear), .clock(clock), .enable(HI_enable), .BusMuxOut(HI_in), .BusMuxIn(HI_out)
);


// Instantiate the LO Register
register #(32, 32, 32'h0) LO_register (
  .clear(clear), .clock(clock), .enable(LO_enable), .BusMuxOut(LO_in), .BusMuxIn(LO_out)
);

// Instantiate the General-Purpose Registers (R0 to R15)
register #(32, 32, 32'h0) gp_register0 (
    .clear(clear), .clock(clock), .enable(gp_enable0), .BusMuxOut(gp_in0), .BusMuxIn(gp_out0)
);

register #(32, 32, 32'h0) gp_register1 (
    .clear(clear), .clock(clock), .enable(gp_enable1), .BusMuxOut(gp_in1), .BusMuxIn(gp_out1)
);

register #(32, 32, 32'h0) gp_register2 (
    .clear(clear), .clock(clock), .enable(gp_enable2), .BusMuxOut(gp_in2), .BusMuxIn(gp_out2)
);

register #(32, 32, 32'h0) gp_register3 (
    .clear(clear), .clock(clock), .enable(gp_enable3), .BusMuxOut(gp_in3), .BusMuxIn(gp_out3)
);

register #(32, 32, 32'h0) gp_register4 (
    .clear(clear), .clock(clock), .enable(gp_enable4), .BusMuxOut(gp_in4), .BusMuxIn(gp_out4)
);

register #(32, 32, 32'h0) gp_register5 (
    .clear(clear), .clock(clock), .enable(gp_enable5), .BusMuxOut(gp_in5), .BusMuxIn(gp_out5)
);

register #(32, 32, 32'h0) gp_register6 (
    .clear(clear), .clock(clock), .enable(gp_enable6), .BusMuxOut(gp_in6), .BusMuxIn(gp_out6)
);

register #(32, 32, 32'h0) gp_register7 (
    .clear(clear), .clock(clock), .enable(gp_enable7), .BusMuxOut(gp_in7), .BusMuxIn(gp_out7)
);

register #(32, 32, 32'h0) gp_register8 (
    .clear(clear), .clock(clock), .enable(gp_enable8), .BusMuxOut(gp_in8), .BusMuxIn(gp_out8)
);

register #(32, 32, 32'h0) gp_register9 (
    .clear(clear), .clock(clock), .enable(gp_enable9), .BusMuxOut(gp_in9), .BusMuxIn(gp_out9)
);

register #(32, 32, 32'h0) gp_register10 (
    .clear(clear), .clock(clock), .enable(gp_enable10), .BusMuxOut(gp_in10), .BusMuxIn(gp_out10)
);

register #(32, 32, 32'h0) gp_register11 (
    .clear(clear), .clock(clock), .enable(gp_enable11), .BusMuxOut(gp_in11), .BusMuxIn(gp_out11)
);

register #(32, 32, 32'h0) gp_register12 (
    .clear(clear), .clock(clock), .enable(gp_enable12), .BusMuxOut(gp_in12), .BusMuxIn(gp_out12)
);

register #(32, 32, 32'h0) gp_register13 (
    .clear(clear), .clock(clock), .enable(gp_enable13), .BusMuxOut(gp_in13), .BusMuxIn(gp_out13)
);

register #(32, 32, 32'h0) gp_register14 (
    .clear(clear), .clock(clock), .enable(gp_enable14), .BusMuxOut(gp_in14), .BusMuxIn(gp_out14)
);
register #(32, 32, 32'h0) gp_register15 (
    .clear(clear), .clock(clock), .enable(gp_enable15), .BusMuxOut(gp_in15), .BusMuxIn(gp_out15)
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
	 .zhi_output(Z_out[32:63]),
	 .zlo_output(Z_out[0:31]),
	 .pc_output(PC_out),
	 .mdr_output(MDR_out),
	 .inport_output(??),
	 .c_output(??),
	 
	 .gp_enable0(gp_enable0),
	 .gp_enable1(gp_enable1),
	 .gp_enable2(gp_enable2),
	 .gp_enable3(gp_enable3),
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
	 .zhi_enable(Zhi_enable),
	 .zlo_enable(Zlo_enable),
	 .pc_enable(PC_enable),
	 .mdr_enable(MDR_enable),
	 .inport_enable(??),
	 .c_enable(??),
	 
	 .BusMuxOut(BusMuxout)
);

alu alu_instance(
	
);
endmodule

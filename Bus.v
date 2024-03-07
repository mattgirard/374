module Bus (
    input [31:0] gp_output0,
    input [31:0] gp_output1,
    input [31:0] gp_output2,
    input [31:0] gp_output3,
    input [31:0] gp_output4,
    input [31:0] gp_output5,
    input [31:0] gp_output6,
    input [31:0] gp_output7,
    input [31:0] gp_output8,
    input [31:0] gp_output9,
    input [31:0] gp_output10,
    input [31:0] gp_output11,
    input [31:0] gp_output12,
    input [31:0] gp_output13,
    input [31:0] gp_output14,
    input [31:0] gp_output15,
	 input [31:0] hi_output,
	 input [31:0] lo_output,
	 input [31:0] zhi_output,
	 input [31:0] zlo_output,
	 input [31:0] pc_output,
	 input [31:0] mdr_output,
	 input [31:0] inport_output,
	 input [31:0] c_output,
	 
	 input gp_out0,
	 input gp_out1,
	 input gp_out2,
	 input gp_out3,
	 input gp_out4,
	 input gp_out5,
	 input gp_out6,
	 input gp_out7,
	 input gp_out8,
	 input gp_out9,
	 input gp_out10,
	 input gp_out11,
	 input gp_out12,
	 input gp_out13,
	 input gp_out14,
	 input gp_out15,
	 input hi_out,
	 input lo_out,
	 input zhi_out,
	 input zlo_out,
	 input pc_out,
	 input mdr_out,
	 input inport_out,
	 input c_out,
	 
    output wire [31:0] BusMuxOut
);

reg [31:0] q;
wire [4:0] encode_output;

// Concatenate all out signals into one 32-bit bus
wire [31:0] out_bus = {
    gp_out15, gp_out14, gp_out13, gp_out12,
    gp_out11, gp_out10, gp_out9, gp_out8,
    gp_out7, gp_out6, gp_out5, gp_out4,
    gp_out3, gp_out2, gp_out1, gp_out0,
    hi_out, lo_out, zhi_out, zlo_out,
    pc_out, mdr_out, inport_out, c_out,
    7'b0 // Pad the remaining bits with zeros if there are less than 32 outs
};
encoder5 encoder(
	.in(out_bus),
	.out(encode_output)
);

always @ (*) begin
    case (encode_output)
	 5'b00000: q = gp_output0;
	 5'b00001: q = gp_output1;
	 5'b00010: q = gp_output2;
	 5'b00011: q = gp_output3;
	 5'b00100: q = gp_output4;
	 5'b00101: q = gp_output5;
	 5'b00110: q = gp_output6;
	 5'b00111: q = gp_output7;
	 5'b01000: q = gp_output8;
	 5'b01001: q = gp_output9;
	 5'b01010: q = gp_output10;
	 5'b01011: q = gp_output11;
	 5'b01100: q = gp_output12;
	 5'b01101: q = gp_output13;
	 5'b01110: q = gp_output14;
	 5'b01111: q = gp_output15;
	 5'b10000: q = hi_output;
	 5'b10001: q = lo_output;
	 5'b10010: q = zhi_output;
	 5'b10011: q = zlo_output;
	 5'b10100: q = pc_output;
	 5'b10101: q = mdr_output;
	 5'b10110: q = inport_output;
	 5'b10111: q = c_output;

	 default: q = 32'd0; // Default case if none is selected
	 endcase
end

assign BusMuxOut = q;

endmodule

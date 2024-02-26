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
	 input [31:0] hi_output;
	 input [31:0] lo_output;
	 input [31:0] zhi_output;
	 input [31:0] zlo_output;
	 input [31:0] pc_output;
	 input [31:0] mdr_output;
	 input [31:0] inport_output;
	 input [31:0] c_output;
	 
	 input gp_enable0;
	 input gp_enable1;
	 input gp_enable2;
	 input gp_enable3;
	 input gp_enable4;
	 input gp_enable5;
	 input gp_enable6;
	 input gp_enable7;
	 input gp_enable8;
	 input gp_enable9;
	 input gp_enable10
	 input gp_enable11;
	 input gp_enable12;
	 input gp_enable13;
	 input gp_enable14;
	 input gp_enable15;
	 input hi_enable;
	 input lo_enable;
	 input zhi_enable;
	 input zlo_enable;
	 input pc_enable;
	 input mdr_enable;
	 input inport_enable;
	 input c_enable;
	 
    output wire [31:0] BusMuxOut;
);

reg [31:0] q;
wire [4:0] encoder_output;

// Concatenate all enable signals into one 32-bit bus
wire [31:0] enable_bus = {
    gp_enable15, gp_enable14, gp_enable13, gp_enable12,
    gp_enable11, gp_enable10, gp_enable9, gp_enable8,
    gp_enable7, gp_enable6, gp_enable5, gp_enable4,
    gp_enable3, gp_enable2, gp_enable1, gp_enable0,
    hi_enable, lo_enable, zhi_enable, zlo_enable,
    pc_enable, mdr_enable, inport_enable, c_enable,
    7'b0 // Pad the remaining bits with zeros if there are less than 32 enables
};
encoder encoder(
	.in(enable_bus),
	.out(encode_output)
);

always @ (*) begin
    case (encode_output)
	 4'b00000: q = gp_output0;
	 4'b00001: q = gp_output1;
	 4'b00010: q = gp_output2;
	 4'b00011: q = gp_output3;
	 4'b00100: q = gp_output4;
	 4'b00101: q = gp_output5;
	 4'b00110: q = gp_output6;
	 4'b00111: q = gp_output7;
	 4'b01000: q = gp_output8;
	 4'b01001: q = gp_output9;
	 4'b01010: q = gp_output10;
	 4'b01011: q = gp_output11;
	 4'b01100: q = gp_output12;
	 4'b01101: q = gp_output13;
	 4'b01110: q = gp_output14;
	 4'b01111: q = gp_output15;
	 4'b10000: q = hi_output;
	 4'b10001: q = lo_output;
	 4'b10010: q = zhi_output;
	 4'b10011: q = zlo_output;
	 4'b10100: q = pc_output;
	 4'b10101: q = mdr_output;
	 4'b10110: q = inport_output;
	 4'b10111: q = c_output;

	 default: q = 32'd0; // Default case if none is selected
	 endcase
end

assign BusMuxOut = q;

endmodule

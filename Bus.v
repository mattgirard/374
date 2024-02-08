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

    input [3:0] gp_register_select,
    output wire [31:0] BusMuxOut
);

reg [31:0] q;

always @ (*) begin
    case (gp_register_select)
	 4'b0000: q = gp_output0;
	 4'b0001: q = gp_output1;
	 4'b0010: q = gp_output2;
	 4'b0011: q = gp_output3;
	 4'b0100: q = gp_output4;
	 4'b0101: q = gp_output5;
	 4'b0110: q = gp_output6;
	 4'b0111: q = gp_output7;
	 4'b1000: q = gp_output8;
	 4'b1001: q = gp_output9;
	 4'b1010: q = gp_output10;
	 4'b1011: q = gp_output11;
	 4'b1100: q = gp_output12;
	 4'b1101: q = gp_output13;
	 4'b1110: q = gp_output14;
	 4'b1111: q = gp_output15;
	 default: q = 32'd0; // Default case if none is selected
	 endcase
end

assign BusMuxOut = q;

endmodule

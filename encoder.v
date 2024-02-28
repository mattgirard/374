module encoder5 (
    input [31:0] in, // 32 input lines
    output reg [4:0] out // 5-bit output
);

always @ (*) begin
    casez (in)
        32'b00000000000000000000000000000001: out = 5'd0;
        32'b0000000000000000000000000000001?: out = 5'd1;
        32'b000000000000000000000000000001??: out = 5'd2;
        32'b00000000000000000000000000001???: out = 5'd3;
        32'b0000000000000000000000000001????: out = 5'd4;
        32'b000000000000000000000000001?????: out = 5'd5;
        32'b00000000000000000000000001??????: out = 5'd6;
        32'b0000000000000000000000001???????: out = 5'd7;
        32'b000000000000000000000001????????: out = 5'd8;
        32'b00000000000000000000001?????????: out = 5'd9;
        32'b0000000000000000000001??????????: out = 5'd10;
        32'b000000000000000000001???????????: out = 5'd11;
        32'b00000000000000000001????????????: out = 5'd12;
        32'b0000000000000000001?????????????: out = 5'd13;
        32'b000000000000000001??????????????: out = 5'd14;
        32'b00000000000000001???????????????: out = 5'd15;
        32'b0000000000000001????????????????: out = 5'd16;
        32'b000000000000001?????????????????: out = 5'd17;
        32'b00000000000001??????????????????: out = 5'd18;
        32'b0000000000001???????????????????: out = 5'd19;
        32'b000000000001????????????????????: out = 5'd20;
        32'b00000000001?????????????????????: out = 5'd21;
        32'b0000000001??????????????????????: out = 5'd22;
        32'b000000001???????????????????????: out = 5'd23;
        32'b00000001????????????????????????: out = 5'd24;
        32'b0000001?????????????????????????: out = 5'd25;
        32'b000001??????????????????????????: out = 5'd26;
        32'b00001???????????????????????????: out = 5'd27;
        32'b0001????????????????????????????: out = 5'd28;
        32'b001?????????????????????????????: out = 5'd29;
        32'b01??????????????????????????????: out = 5'd30;
        32'b1???????????????????????????????: out = 5'd31;
        default: out = 5'd0; // Default case if none is selected
    endcase
end

endmodule
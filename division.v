

/*module division(dividend, divisor, quotient, remainder);

    input signed [31:0] dividend, divisor;
    output reg [31:0] quotient, remainder;

    reg signed [63:0] tempDividend; // Extended dividend to accommodate shifting
    reg [31:0] tempDivisor;
    integer i;

    always @(*) begin
        // Initialize the output and temporary registers
        quotient = 32'd0;
        remainder = 32'd0;
        tempDividend = {32'd0, dividend}; // Place Dividend in the lower part of tempDividend
        tempDivisor = divisor;

        // Check for division by zero
        if (divisor != 0) begin
            for (i = 0; i < 32; i = i + 1) begin
                tempDividend = tempDividend << 1; // Shift left to check each bit
                quotient = quotient << 1; // Make room for the next bit in the quotient

                // Subtract Divisor from the shifted value of Dividend
                if (tempDividend[63:32] >= tempDivisor) begin
                    tempDividend[63:32] = tempDividend[63:32] - tempDivisor;
                    quotient[0] = 1'b1; // Set the lowest bit of Quotient if subtraction is possible
                end
            end
            remainder = tempDividend[63:32]; // The remainder is the upper 32 bits of tempDividend after the loop
        end else begin
            $display("Error: Division by zero.");
            // Optionally set Quotient and Remainder to indicate error
            quotient = 32'dx; // Indeterminate value for error condition
            remainder = 32'dx; // Indeterminate value for error condition
        end
    end
endmodule
*/

module division(
 input wire [31:0] dividend, divisor,
    output reg [31:0] quotient, remainder
	 );
	 
integer i; 
reg [31:0] m, a, q, temp;
always @(dividend or divisor)
begin
a= 32'd0;
q= dividend;
m= divisor;
for(i=0;i<32;i=i+1)
begin
a={a[30:0],q[31]};
temp = a-m;
if (temp[31]==1)begin
q={q[30:0],1'b0};
end
else begin
q={q[30:0],1'b1};
a=temp;
end
end
remainder = a;
quotient = q;
end
endmodule

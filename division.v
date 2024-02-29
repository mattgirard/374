/*module division (dividend, divisor, quotient, remainder);
    
	 input signed [31:0] dividend;
    input signed [31:0] divisor;
    output reg [31:0] quotient;
    output reg [31:0] remainder;

    // Internal variables
    reg [63:0] temp_dividend; // Use a 64-bit register to accommodate shifts
    reg [31:0] temp_divisor;
    integer i;
    
	always @(*) begin
        // Initialize quotient and remainder
        quotient = 0;
        remainder = 0;
        if (divisor == 0) begin
            $display("Error: Division by zero");
            // Handle division by zero if needed
        end else begin
            temp_dividend = dividend; // Place dividend in the upper half
            temp_divisor = divisor;
            temp_dividend = temp_dividend << 32; // Shift left to start division
            
            for (i = 0; i <= 31; i = i + 1) begin
                // Shift left by 1 (simulating division step)
                temp_dividend = temp_dividend << 1;
                
                // Compare upper half of temp_dividend with divisor
                if (temp_dividend[63:32] >= temp_divisor) begin
                    temp_dividend[63:32] = temp_dividend[63:32] - temp_divisor;
                    quotient = quotient << 1; // Make room for the new bit
                    quotient = quotient | 1; // Set the least significant bit
                end else begin
							quotient = quotient << 1; // Still need to shift quotient but add 0
                end
            end
            remainder = temp_dividend[63:32]; // Upper half is the remainder
        end
    end

endmodule

*/

module division(dividend, divisor, quotient, remainder);

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
module division (
    input wire [31:0] dividend,
    input wire [31:0] divisor,
    output reg [31:0] quotient,
    output reg [31:0] remainder
);
    
    // Internal variables
    reg [31:0] temp_dividend;
    reg [63:0] temp_quotient;
    integer i;
    
    initial begin
		$display("divisor %d", divisor);
        quotient = 0; // Initialize quotient
        remainder = 0; // Initialize remainder
        temp_dividend = dividend; // Copy of dividend for manipulation
        temp_quotient = 0; // Temporary quotient for calculation
        
        // Division algorithm
        for (i = 31; i >= 0; i = i - 1) begin
            // Shift temp_quotient left by 1 bit to make room for next bit of quotient
            temp_quotient = temp_quotient << 1;
            
            // Shift temp_dividend left by 1, effectively multiplying by 2
            temp_dividend = temp_dividend << 1;
            
            // Check if this bit of divisor can be subtracted
            if (temp_dividend >= divisor) begin
                temp_dividend = temp_dividend - divisor; // Subtract divisor from temp_dividend
                temp_quotient = temp_quotient | 1; // Set least significant bit of temp_quotient
            end
        end
        
        quotient = temp_quotient[31:0]; // Final quotient
        remainder = temp_dividend; // Remaining dividend is the remainder
    end
    
endmodule
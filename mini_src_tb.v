`timescale 1ns / 1ps

module mini_src_tb;

    // Inputs to the mini_src
    reg clock;
    reg clear;
    reg [3:0] gp_register_select; // Control signal for selecting the register
    reg [31:0] gp_input[15:0]; // Input data for each register
    reg [15:0] gp_enable; // Enable signals for each register
    wire [31:0] BusMuxOut; // Output of the bus
	 
	 integer i;


    // Instantiate the mini_src
    mini_src uut (
        .clear(clear),
        .clock(clock),
        // ... other connections
        // Connect the gp_output wires from the uut to the BusMuxOut wire in the testbench
        .gp_output(gp_output),
        .gp_register_select(gp_register_select),
        .BusMuxOut(BusMuxOut)
    );

    // Generate a clock signal
    initial begin
        clock = 0;
        forever #10 clock = ~clock;
    end

    // Test sequence
    initial begin
        // Initialize inputs
        clear = 1'b1;
        gp_register_select = 4'b0;
        gp_enable = 16'h0;
        gp_input = {16{32'h0}};

        // Apply reset
        #20;
        clear = 1'b0;
        
        // Write loop
        for (i = 0; i < 16; i = i + 1) begin
            // Enable only one register at a time
            gp_enable = 1 << i; // Enable signal for the ith register
            gp_input[i] = i; // Write the index to the ith register
            #20; // Wait for the write operation to complete
        end
        gp_enable = 16'h0; // Disable all registers after writing

        // Read back loop
        for (i = 0; i < 16; i = i + 1) begin
            gp_register_select = i; // Select the ith register to read
            #20; // Wait for the bus to reflect the selected register's value
            if (BusMuxOut !== i) begin
                $display("Error: Register R%d does not contain the correct value %d, actual value is %d", i, i, BusMuxOut);
            end else begin
                $display("Success: Register R%d contains the correct value %d", i, BusMuxOut);
            end
        end
        
        // Add more test cases as needed

        // Finish the simulation
        #100;
        $finish;
    end

    initial begin
        $monitor("Time = %t : gp_register_select = %b, BusMuxOut = %h", $time, gp_register_select, BusMuxOut);
    end

endmodule

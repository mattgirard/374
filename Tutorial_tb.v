`timescale 1ns / 1ps

module Tutorial_tb;

    // Inputs to the DataPath
    reg clock;
    reg clear;
    reg write_enable1;
    reg [7:0] write_data1;

    // Output from R1
    wire [7:0] read_data1;

    // Instantiate the DataPath
    DataPath uut (
        .clock(clock),
        .clear(clear),
        .write_enable1(write_enable1),
        .write_data1(write_data1),
        .read_data1(read_data1)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #10 clock = ~clock;
    end

    // Test sequence
    initial begin
        // Initialize Inputs
        clear = 1;
        write_enable1 = 0;
        write_data1 = 8'd0;

        // Reset the system
        #50;
        clear = 0;

        // Test Case: Write to R1
        write_enable1 = 1;
        write_data1 = 8'd123; // Example value to write
        #20; // Wait for a while
        write_enable1 = 0; // Disable write after writing

        // Add more test cases as needed

        // Finish the simulation
        #100;
        $finish;
    end

    initial begin
        $monitor("Time = %t : write_enable1 = %b, write_data1 = %d, read_data1 = %d",
                  $time, write_enable1, write_data1, read_data1);
    end

endmodule

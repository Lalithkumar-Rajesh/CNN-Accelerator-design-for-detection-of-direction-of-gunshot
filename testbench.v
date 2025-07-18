`timescale 1ns / 1ps


module testbench;
    reg clk, reset;
    reg [7:0] pixel_in;
    reg [1:0] kernel_size;
    wire detected;

    cnn_accelerator uut (
        .clk(clk),
        .reset(reset),
        .pixel_in(pixel_in),
        .kernel_size(kernel_size),
        .detected(detected)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        pixel_in = 8'h00;
        kernel_size = 2'b00;
        #10 reset = 0;

        // Test 3x3
        $display("Testing 3x3 Kernel...");
        repeat (5) begin
            pixel_in = $random;
            #10;
        end
        #50;
        if (!detected) $display("ERROR: 3x3 detection failed!");
        else $display("3x3 detection passed!");

        // Test 5x5
        kernel_size = 2'b01;
        #20;
        $display("Testing 5x5 Kernel...");
        repeat (5) begin
            pixel_in = $random;
            #10;
        end
        #50;
        if (!detected) $display("ERROR: 5x5 detection failed!");
        else $display("5x5 detection passed!");

        // Test 7x7
        kernel_size = 2'b10;
        #20;
        $display("Testing 7x7 Kernel...");
        repeat (5) begin
            pixel_in = $random;
            #10;
        end
        #50;
        if (!detected) $display("ERROR: 7x7 detection failed!");
        else $display("7x7 detection passed!");

        $finish;
    end

endmodule

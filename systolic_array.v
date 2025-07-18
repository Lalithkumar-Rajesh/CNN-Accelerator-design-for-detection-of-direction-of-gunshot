module systolic_array (
    input clk,
    input reset,
    input [1:0] kernel_size,
    input [7:0] pixel_in,
    output reg signed [15:0] conv_result
);
    reg [5:0] index;
    wire signed [7:0] kernel_val;
    reg signed [15:0] partial_sum;
    wire signed [15:0] pe_sum;

    kernel_rom kr (
        .kernel_size(kernel_size),
        .addr(index),
        .kernel_val(kernel_val)
    );

    pe pe_inst (
        .clk(clk),
        .reset(reset),
        .pixel(pixel_in),
        .weight(kernel_val),
        .partial_sum_in(partial_sum),
        .partial_sum_out(pe_sum)
    );

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            index <= 0;
            partial_sum <= 0;
            conv_result <= 0;
        end else begin
            if ((kernel_size == 2'b00 && index < 9) ||
                (kernel_size == 2'b01 && index < 25) ||
                (kernel_size == 2'b10 && index < 49)) begin
                partial_sum <= pe_sum;
                index <= index + 1;
            end else begin
                conv_result <= partial_sum;
                index <= 0;
                partial_sum <= 0;
            end
        end
    end
endmodule

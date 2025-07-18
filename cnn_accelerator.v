module cnn_accelerator (
    input clk,
    input reset,
    input [7:0] pixel_in,
    input [1:0] kernel_size,
    output reg detected
);
    wire signed [15:0] conv_result;

    systolic_array sa (
        .clk(clk),
        .reset(reset),
        .kernel_size(kernel_size),
        .pixel_in(pixel_in),
        .conv_result(conv_result)
    );

    always @(posedge clk or posedge reset) begin
        if (reset)
            detected <= 0;
        else begin
            case (kernel_size)
                2'b00: detected <= (conv_result > 16'sd200);
                2'b01: detected <= (conv_result > 16'sd500);
                2'b10: detected <= (conv_result > 16'sd1000);
                default: detected <= 0;
            endcase
        end
    end
endmodule


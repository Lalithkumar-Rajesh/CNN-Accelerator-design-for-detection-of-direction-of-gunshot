module pe (
    input clk,
    input reset,
    input signed [7:0] pixel,
    input signed [7:0] weight,
    input signed [15:0] partial_sum_in,
    output reg signed [15:0] partial_sum_out
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            partial_sum_out <= 0;
        else
            partial_sum_out <= partial_sum_in + (pixel * weight);
    end
endmodule


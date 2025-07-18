module kernel_rom (
    input [1:0] kernel_size,
    input [5:0] addr,  // Max address needed is 48 (for 7x7)
    output reg signed [7:0] kernel_val
);
    always @(*) begin
        case (kernel_size)
            2'b00: begin // 3x3 Sobel kernel
                case (addr)
                    0, 6: kernel_val = 1;
                    1, 7: kernel_val = 0;
                    2, 8: kernel_val = -1;
                    3, 5: kernel_val = 2;
                    4: kernel_val = 0;
                    default: kernel_val = -2;
                endcase
            end
            2'b01: begin // 5x5 example kernel
                case (addr)
                    0, 4, 20, 24: kernel_val = 1;
                    1, 3, 21, 23: kernel_val = 2;
                    2, 22: kernel_val = 4;
                    5, 15: kernel_val = 3;
                    10, 14: kernel_val = 6;
                    6, 18: kernel_val = -1;
                    7, 17: kernel_val = -2;
                    8, 16: kernel_val = -4;
                    default: kernel_val = 0;
                endcase
            end
            2'b10: begin // 7x7 alternate kernel
                kernel_val = (addr[0] == 1'b0) ? 1 : -1;
            end
            default: kernel_val = 0;
        endcase
    end
endmodule


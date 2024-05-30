`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HITSZ
// Engineer: Maxwell Jay
// 
// Create Date: 2024/05/30 14:58:42
// Design Name: 
// Module Name: Subtracter
// Project Name: Subtracter
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Subtracter(
    input [3:0] minuend,
    input [3:0] subtrahend,

    output [7:0] outseg_low,
    output [7:0] outseg_high,
    output [1:0] DK
);

    reg [3:0] result_reg; // 减法计算结果

    reg [3:0] num_high_reg; // 差的个位数
    reg [3:0] num_low_reg; // 差的十位数

    reg [7:0] outseg_low_reg; // 个位数码管
    reg [7:0] outseg_high_reg; // 十位数码管
    
    always @(*) begin
        result_reg = minuend - subtrahend;

        // 将 result_reg 分解为个位数和十位数
        num_high_reg = result_reg[3:0] / 10;
        num_low_reg = result_reg[3:0] % 10;

        case (num_low_reg) // 个位数
            4'b0000: outseg_low_reg = 8'b00111111; // 0
            4'b0001: outseg_low_reg = 8'b00000110; // 1
            4'b0010: outseg_low_reg = 8'b01011011; // 2
            4'b0011: outseg_low_reg = 8'b01001111; // 3
            4'b0100: outseg_low_reg = 8'b01100110; // 4
            4'b0101: outseg_low_reg = 8'b01101101; // 5
            4'b0110: outseg_low_reg = 8'b01111100; // 6
            4'b0111: outseg_low_reg = 8'b00000111; // 7
            4'b1000: outseg_low_reg = 8'b01111111; // 8
            4'b1001: outseg_low_reg = 8'b01101111; // 9
            default: outseg_low_reg = 8'b00000000; // off
        endcase

        case (num_high_reg) // 十位数
            4'b0000: outseg_high_reg = 8'b00111111; // 0
            4'b0001: outseg_high_reg = 8'b00000110; // 1
            4'b0010: outseg_high_reg = 8'b01011011; // 2
            4'b0011: outseg_high_reg = 8'b01001111; // 3
            4'b0100: outseg_high_reg = 8'b01100110; // 4
            4'b0101: outseg_high_reg = 8'b01101101; // 5
            4'b0110: outseg_high_reg = 8'b01111100; // 6
            4'b0111: outseg_high_reg = 8'b00000111; // 7
            4'b1000: outseg_high_reg = 8'b01111111; // 8
            4'b1001: outseg_high_reg = 8'b01101111; // 9
            default: outseg_high_reg = 8'b00000000; // off
        endcase
    end

    assign DK = 2'b11; // 使能两个数码管
    assign outseg_low = outseg_low_reg;
    assign outseg_high = outseg_high_reg;

endmodule
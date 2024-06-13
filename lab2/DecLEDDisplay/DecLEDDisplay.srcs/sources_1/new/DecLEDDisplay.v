`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HITSZ
// Engineer: Maxwell Jay
// 
// Create Date: 2024/06/12 11:10:23
// Design Name: 
// Module Name: DecLEDDisplay
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 二进制码转换十进制并用数码管显示
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DecLEDDisplay(
    input clk, // 时钟信号
    input [3:0] dec_in, // 输入的十进制数
    input refresh, // 更新按键
    output [7:0] outseg, // 数码管输出
    output [1:0] CS // 片选信号
    );

    reg [3:0] num_high_reg; // 十位数
    reg [3:0] num_low_reg; // 个位数
    reg [7:0] outseg_low_reg;
    reg [7:0] outseg_high_reg;
    reg [7:0] outseg_reg; // 数码管寄存器
    reg [1:0] CS_reg; // 片选信号寄存器

    // 50 Hz 分频
    reg [26:0] divclk_cnt;
    reg divclk = 0;
    parameter divfreq = 200; // 分频频率
    always @(posedge clk) begin
        if (divclk_cnt < 100000000 / divfreq / 2 - 1)
            divclk_cnt <= divclk_cnt + 1;
        else begin
            divclk <= ~divclk;
            divclk_cnt <= 0;
        end
    end

    // 处理输入
    always @(posedge clk) begin
        num_high_reg <= dec_in / 10;
        num_low_reg <= dec_in % 10;
    end

    // 更新数码管显示
    always @(posedge clk) begin
        if (refresh) begin // 只有按键按下时才更新
            case (num_low_reg)
                4'b0000: outseg_low_reg = 8'b00111111; // 0
                4'b0001: outseg_low_reg = 8'b00000110; // 1
                4'b0010: outseg_low_reg = 8'b01011011; // 2
                4'b0011: outseg_low_reg = 8'b01001111; // 3
                4'b0100: outseg_low_reg = 8'b01100110; // 4
                4'b0101: outseg_low_reg = 8'b01101101; // 5
                4'b0110: outseg_low_reg = 8'b01111101; // 6
                4'b0111: outseg_low_reg = 8'b00000111; // 7
                4'b1000: outseg_low_reg = 8'b01111111; // 8
                4'b1001: outseg_low_reg = 8'b01101111; // 9
                default: outseg_low_reg = 8'b00000000; // off
            endcase

            case (num_high_reg)
                4'b0000: outseg_high_reg = 8'b00111111; // 0
                4'b0001: outseg_high_reg = 8'b00000110; // 1
                4'b0010: outseg_high_reg = 8'b01011011; // 2
                4'b0011: outseg_high_reg = 8'b01001111; // 3
                4'b0100: outseg_high_reg = 8'b01100110; // 4
                4'b0101: outseg_high_reg = 8'b01101101; // 5
                4'b0110: outseg_high_reg = 8'b01111101; // 6
                4'b0111: outseg_high_reg = 8'b00000111; // 7
                4'b1000: outseg_high_reg = 8'b01111111; // 8
                4'b1001: outseg_high_reg = 8'b01101111; // 9
                default: outseg_high_reg = 8'b00000000; // off
            endcase
        end
    end

    // 使用二进制计数器轮流使能两个数码管
    reg cnt = 0;
    always @(posedge divclk) begin
        cnt <= ~cnt;
        case (cnt)
            1'b0: begin
                CS_reg <= 2'b01; // 使能低段数码管
                outseg_reg <= outseg_low_reg;
            end
            1'b1: begin
                CS_reg <= 2'b10; // 使能高段数码管
                outseg_reg <= outseg_high_reg;
            end
            default: begin
                CS_reg <= 2'b00;
                outseg_reg <= 8'b00000000; // off
            end
        endcase
    end

    assign CS = CS_reg;
    assign outseg = outseg_reg;
endmodule

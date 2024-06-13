`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HITSZ
// Engineer: Maxwell Jay
// 
// Create Date: 2024/06/11 23:18:34
// Design Name: 
// Module Name: LightController
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 使用状态机实现的彩灯控制器
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LightController(
    input clk,
    input cin,
    input rst,
    output btn, // cin 指示灯
    output [7:0] dout
    );

    reg clk_2Hz = 0; // 2 Hz 时钟信号
    reg clk_en; // 5 ms 周期的使能信号
    wire outp; // 按键消抖输出
    wire cin_xd;
    wire outpulse; // 单脉冲输出
    wire cin_pu;
    reg [7:0] dout_reg;

    // 2 Hz 分频
    reg [26:0] divclk_cnt_2Hz;
    always @(posedge clk) begin
        if (divclk_cnt_2Hz < 100000000 / 2 / 2 - 1)
            divclk_cnt_2Hz <= divclk_cnt_2Hz + 1;
        else begin
            clk_2Hz <= ~clk_2Hz;
            divclk_cnt_2Hz <= 0;
        end
    end

    // 5 ms 分频
    reg [26:0] divclk_cnt_5ms;
    always @(posedge clk) begin
        if (divclk_cnt_5ms < 100000000 / 200 / 2 - 1)
            divclk_cnt_5ms <= divclk_cnt_5ms + 1;
        else begin
            clk_en <= ~clk_en;
            divclk_cnt_5ms <= 0;
        end
    end

    // 使用 3 个 D 触发器实现按键消抖，连续 3 个 5 ms 周期都输入 cin 才认为按键按下，outp = 1
    reg delay1 = 0, delay2 = 0, delay3 = 0;
    always @(posedge clk_en) begin
        if (cin == 1)
            delay1 <= 1;
        else
            delay1 <= 0;
    end
    always @(posedge clk_en) begin
        delay2 <= delay1;
    end
    always @(posedge clk_en) begin
        delay3 <= delay2;
    end
    assign outp = delay1 & delay2 & delay3;
    assign btn = outp;

    assign cin_xd = outp;

    // 单脉冲产生电路
    reg q_outpulse;
    always @(posedge clk) begin
        if (cin_xd == 1)
            q_outpulse <= 1;
        else
            q_outpulse <= 0;
    end
    assign outpulse = cin_xd & ~q_outpulse;

    assign cin_pu = outpulse;
    
    reg [3:0] NS = 3'b000, CS; // NS: Next State, CS: Current State
    parameter [3:0]
        M1 = 3'b000,
        M2 = 3'b001,
        M3 = 3'b010,
        M4 = 3'b011,
        M5 = 3'b100;
    
    // 第 1 个 always 块：状态转移
    always @(posedge clk or posedge rst) begin
        if (rst)
            CS <= M1;
        else
            CS <= NS;
    end

    // 第 2 个 always 块：状态转移逻辑
    always @(CS or cin_pu) begin
        case (CS)
            M1: begin
                if (cin_pu == 1)
                    NS = M2;
                else
                    NS = M1;
            end
            M2: begin
                if (cin_pu)
                    NS = M3;
                else
                    NS = M2;
            end
            M3: begin
                if (cin_pu)
                    NS = M4;
                else
                    NS = M3;
            end
            M4: begin
                if (cin_pu)
                    NS = M5;
                else
                    NS = M4;
            end
            M5: begin
                if (cin_pu)
                    NS = M1;
                else
                    NS = M5;
            end
            default: NS = M1;
        endcase
    end

    // 8 进制计数器，用于 M3, M4, M5 状态
    reg [3:0] cnt_8;
    always @(posedge clk_2Hz) begin
        if (cnt_8 < 3'b111)
            cnt_8 <= cnt_8 + 1;
        else
            cnt_8 <= 3'b000;
    end

    // 第 3 个 always 块：状态输出
    always @(posedge clk) begin
        case (CS)
            M1: begin
                dout_reg <= 8'b0000_0000;
            end
            M2: begin
                dout_reg <= 8'b1111_1111;
            end
            M3: begin
                // 一次仅有 1 个灯亮，且每 0.5s 左移一位
                case (cnt_8)
                    3'b000: dout_reg <= 8'b0000_0001;
                    3'b001: dout_reg <= 8'b0000_0010;
                    3'b010: dout_reg <= 8'b0000_0100;
                    3'b011: dout_reg <= 8'b0000_1000;
                    3'b100: dout_reg <= 8'b0001_0000;
                    3'b101: dout_reg <= 8'b0010_0000;
                    3'b110: dout_reg <= 8'b0100_0000;
                    3'b111: dout_reg <= 8'b1000_0000;
                    default: dout_reg <= 8'b0000_0000;
                endcase
            end
            M4: begin
                // 一次仅有 1 个灯亮，且每 0.5s 右移一位
                case (cnt_8)
                    3'b000: dout_reg <= 8'b1000_0000;
                    3'b001: dout_reg <= 8'b0100_0000;
                    3'b010: dout_reg <= 8'b0010_0000;
                    3'b011: dout_reg <= 8'b0001_0000;
                    3'b100: dout_reg <= 8'b0000_1000;
                    3'b101: dout_reg <= 8'b0000_0100;
                    3'b110: dout_reg <= 8'b0000_0010;
                    3'b111: dout_reg <= 8'b0000_0001;
                    default: dout_reg <= 8'b0000_0000;
                endcase
            end
            M5: begin
                // 8 个灯间隔点亮，每 0.5s 交替亮灭
                case (cnt_8)
                    3'b000: dout_reg <= 8'b1010_1010;
                    3'b001: dout_reg <= 8'b0101_0101;
                    3'b010: dout_reg <= 8'b1010_1010;
                    3'b011: dout_reg <= 8'b0101_0101;
                    3'b100: dout_reg <= 8'b1010_1010;
                    3'b101: dout_reg <= 8'b0101_0101;
                    3'b110: dout_reg <= 8'b1010_1010;
                    3'b111: dout_reg <= 8'b0101_0101;
                    default: dout_reg <= 8'b0000_0000;
                endcase
            end
            default: dout_reg <= 8'b0000_0000;
        endcase
    end

    assign dout = dout_reg;

endmodule

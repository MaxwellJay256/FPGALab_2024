`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HITSZ
// Engineer: Maxwell Jay
// 
// Create Date: 2024/06/04 16:02:09
// Design Name: 
// Module Name: DFlipFlop_tb
// Project Name: 
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


module DFlipFlop_tb(

    );
    reg clk;
    reg rst;
    reg d;
    reg en;
    wire q;

    DFlipFlop DFlipFlop_inst(
        .clk(clk),
        .reset(rst),
        .d(d),
        .en(en),
        .q(q)
    );

    initial begin
        clk = 1'b0;
        en = 1'b1; // 打开使能
        d = 1'b0;
        rst = 1'b1;
        #10 rst = 1'b0; // 使用一次复位

        // 测试同步使能
        #20 en = 1'b0;
        #20 en = 1'b1;
        #20 en = 1'b0;
        #20 en = 1'b1;

        // 测试异步复位
        #20 rst = 1'b1;
        #10 en = 1'b0;
        #10 en = 1'b1; // 开关使能均不影响复位
        #10 rst = 1'b0;

        #20 $finish;
    end

    // 产生时钟信号，每 5 ns 翻转一次
    always begin
        #5 clk = ~clk;
    end

    // 产生输入信号 d，每 8 ns 翻转一次
    always begin
        d = 1'b0;
        #8 d = 1'b1;
        #8;
    end
    
endmodule

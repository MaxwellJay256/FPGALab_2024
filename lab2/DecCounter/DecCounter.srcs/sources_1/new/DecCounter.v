`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HITSZ
// Engineer: Maxwell Jay
// 
// Create Date: 2024/06/04 16:18:53
// Design Name: 
// Module Name: DecCounter
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


module DecCounter(
    input clk,
    input enable,
    output [3:0] out
    );
    reg [26:0] divclk;
    reg [3:0] reg4; // 4 bits counter
    reg cout_1s; // 1 Hz counter

    // 对 100 M 时钟分频产生 1 Hz 时钟信号
    always @(posedge clk) begin
        if (divclk < 100000000 - 1) begin
            divclk <= divclk + 1;
            cout_1s <= 1'b0;
        end else begin
            divclk <= 0;
            cout_1s <= 1'b1;
        end
    end

    // 1 Hz 时钟信号下十进制计数器
    always @(posedge clk) begin
        if (enable && cout_1s) begin
            if (reg4 < 10 - 1)
                reg4 <= reg4 + 1;
            else
                reg4 <= 0;
        end else
            reg4 <= reg4;
    end

    assign out = reg4;
    
endmodule

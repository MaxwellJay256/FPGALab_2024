`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HITSZ
// Engineer: Maxwell Jay
// 
// Create Date: 2024/06/04 16:01:37
// Design Name: 
// Module Name: DFlipFlop
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 含异步复位和同步使能的 D 触发器
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DFlipFlop(
    input clk,
    input reset,
    input d,
    input en,
    output q
    );

    reg q_reg;

    always @(posedge clk, posedge reset) begin
        if (reset)
            q_reg <= 1'b0;
        else if (en)
            q_reg <= d;
    end

    assign q = q_reg;

endmodule

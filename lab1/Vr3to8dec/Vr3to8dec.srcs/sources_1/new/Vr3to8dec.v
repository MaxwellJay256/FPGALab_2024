`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HITSZ
// Engineer: Maxwell Jay
// 
// Create Date: 2024/05/29 19:26:32
// Design Name: 
// Module Name: Vr3to8dec
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


module Vr3to8dec(
    input EN,
    input [2:0] in_Vr3,
    output [7:0] out_Vr8
    );

    reg [7:0] out_Vr8_reg;

    always @* begin
        if (EN == 0)
            {out_Vr8_reg} = 8'b00000000;
        else
            case ({in_Vr3})
                3'b000: {out_Vr8_reg} = 8'b00000001;
                3'b001: {out_Vr8_reg} = 8'b00000010;
                3'b010: {out_Vr8_reg} = 8'b00000100;
                3'b011: {out_Vr8_reg} = 8'b00001000;
                3'b100: {out_Vr8_reg} = 8'b00010000;
                3'b101: {out_Vr8_reg} = 8'b00100000;
                3'b110: {out_Vr8_reg} = 8'b01000000;
                3'b111: {out_Vr8_reg} = 8'b10000000;
                default: {out_Vr8_reg} = 8'b00000000;
            endcase
    end

    assign out_Vr8 = out_Vr8_reg;

endmodule

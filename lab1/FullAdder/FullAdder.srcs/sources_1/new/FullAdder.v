`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HITSZ
// Engineer: Maxwell Jay
// 
// Create Date: 2024/05/29 20:11:25
// Design Name: 
// Module Name: FullAdder
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


module FullAdder(
    input in_CI, // Carry in
    input in_A,
    input in_B,
    output out_S, // Sum
    output out_CO // Carry out
    );

    reg out_S_reg, out_CO_reg;

    always @ * begin
        case ({in_CI, in_A, in_B})
            3'b000: {out_S_reg, out_CO_reg} = 2'b00;
            3'b001: {out_S_reg, out_CO_reg} = 2'b10;
            3'b010: {out_S_reg, out_CO_reg} = 2'b10;
            3'b011: {out_S_reg, out_CO_reg} = 2'b01;
            3'b100: {out_S_reg, out_CO_reg} = 2'b10;
            3'b101: {out_S_reg, out_CO_reg} = 2'b01;
            3'b110: {out_S_reg, out_CO_reg} = 2'b01;
            3'b111: {out_S_reg, out_CO_reg} = 2'b11;
            default: {out_S_reg, out_CO_reg} = 2'b00;
        endcase
    end

    assign out_S = out_S_reg;
    assign out_CO = out_CO_reg;
    
endmodule

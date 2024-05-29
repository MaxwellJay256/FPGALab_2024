`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HITSZ
// Engineer: Maxwell Jay
// 
// Create Date: 2024/05/29 18:43:27
// Design Name: 
// Module Name: Vr2to4dec
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


module Vr2to4dec(
    input EN,
    input in_A1,
    input in_A0,
    output out_Y3,
    output out_Y2,
    output out_Y1,
    output out_Y0
    );

    wire not_A0, not_A1;
    not U1(not_A0, in_A0); // not_A0 = ~in_A0
    not U2(not_A1, in_A1); // not_A1 = ~in_A1

    and U3(out_Y0, EN, not_A1, not_A0); // out_Y0 = EN & ~A1 & ~A0
    and U4(out_Y1, EN, not_A1, in_A0); // out_Y1 = EN & ~A1 & A0
    and U5(out_Y2, EN, in_A1, not_A0); // out_Y2 = EN & A1 & ~A0
    and U6(out_Y3, EN, in_A1, in_A0); // out_Y3 = EN & A1 & A0

endmodule

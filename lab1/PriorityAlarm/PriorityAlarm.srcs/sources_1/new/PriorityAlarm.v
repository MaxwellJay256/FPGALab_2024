`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HITSZ
// Engineer: Maxwell Jay
// 
// Create Date: 2024/05/29 20:41:34
// Design Name: 
// Module Name: PriorityAlarm
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


module PriorityAlarm(
    input [3:0] in_I,
    output [2:0] out_Y
    );

    wire [3:0] not_I;
    // 令 not_I = ~in_I
    assign not_I = ~in_I;

    // Y0 = I0 || I1 || I2 || I3
    assign out_Y[0] = in_I[0] | in_I[1] | in_I[2] | in_I[3];
    assign out_Y[1] = in_I[3] | (in_I[2] & not_I[3]); // Y1 = I3 || (I2 && ~I3)
    assign out_Y[2] = in_I[3] | (in_I[1] & not_I[2] & not_I[3]); // Y2 = I2 || (I1 && ~I2 && ~I3)

endmodule

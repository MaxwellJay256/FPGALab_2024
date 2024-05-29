`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HITSZ
// Engineer: Maxwell Jay
// 
// Create Date: 2024/05/29 20:41:52
// Design Name: 
// Module Name: PriorityAlarm_tb
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


module PriorityAlarm_tb(
    );
    reg [3:0] in_It;
    wire [2:0] out_Yt;

    PriorityAlarm UUT(
        .in_I(in_It),
        .out_Y(out_Yt)
        );
    
    initial begin
        in_It = 4'b0000;
        #5 in_It = 4'b0001;
        #5 in_It = 4'b0010;
        #5 in_It = 4'b0011;
        #5 in_It = 4'b0100;
        #5 in_It = 4'b0101;
        #5 in_It = 4'b0110;
        #5 in_It = 4'b0111;
        #5 in_It = 4'b1000;
        #5 in_It = 4'b1001;
        #5 in_It = 4'b1010;
        #5 in_It = 4'b1011;
        #5 in_It = 4'b1100;
        #5 in_It = 4'b1101;
        #5 in_It = 4'b1110;
        #5 in_It = 4'b1111;
        #5 in_It = 4'b0000;
        #5 $finish;
    end
endmodule

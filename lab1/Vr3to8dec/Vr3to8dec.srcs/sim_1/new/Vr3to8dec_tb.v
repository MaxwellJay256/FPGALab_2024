`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HITSZ
// Engineer: Maxwell Jay
// 
// Create Date: 2024/05/29 19:31:30
// Design Name: 
// Module Name: Vr3to8dec_tb
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


module Vr3to8dec_tb(
    );
    reg ENt;
    reg [2:0] in_Vr3t;
    wire [7:0] out_Vr8t;

    Vr3to8dec UUT(
        .EN(ENt),
        .in_Vr3(in_Vr3t),
        .out_Vr8(out_Vr8t)
    );

    initial begin
        {ENt, in_Vr3t} = 4'b0000;
        #5 {ENt, in_Vr3t} = 4'b0001;
        #5 {ENt, in_Vr3t} = 4'b0010;
        #5 {ENt, in_Vr3t} = 4'b0011;
        #5 {ENt, in_Vr3t} = 4'b0100;
        #5 {ENt, in_Vr3t} = 4'b0101;
        #5 {ENt, in_Vr3t} = 4'b0110;
        #5 {ENt, in_Vr3t} = 4'b0111;
        #5 {ENt, in_Vr3t} = 4'b1000;    
        #5 {ENt, in_Vr3t} = 4'b1001;
        #5 {ENt, in_Vr3t} = 4'b1010;
        #5 {ENt, in_Vr3t} = 4'b1011;
        #5 {ENt, in_Vr3t} = 4'b1100;
        #5 {ENt, in_Vr3t} = 4'b1101;
        #5 {ENt, in_Vr3t} = 4'b1110;
        #5 {ENt, in_Vr3t} = 4'b1111;
        #5 {ENt, in_Vr3t} = 4'b0000;
        #5 $finish;
    end
endmodule

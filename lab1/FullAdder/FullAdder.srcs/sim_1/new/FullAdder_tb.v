`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HITSZ
// Engineer: Maxwell Jay
// 
// Create Date: 2024/05/29 20:20:55
// Design Name: 
// Module Name: FullAdder_tb
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


module FullAdder_tb(
    );
    reg CIt;
    reg A, B;
    wire St, COt;

    FullAdder FA(
        .in_CI(CIt),
        .in_A(A),
        .in_B(B),
        .out_S(St),
        .out_CO(COt)
    );

    initial begin
        {CIt, A, B} = 3'b000;
        #5 {CIt, A, B} = 3'b001;
        #5 {CIt, A, B} = 3'b010;
        #5 {CIt, A, B} = 3'b011;
        #5 {CIt, A, B} = 3'b100;
        #5 {CIt, A, B} = 3'b101;
        #5 {CIt, A, B} = 3'b110;
        #5 {CIt, A, B} = 3'b111;
        #5 {CIt, A, B} = 3'b000;
        #5 $finish;
    end
endmodule

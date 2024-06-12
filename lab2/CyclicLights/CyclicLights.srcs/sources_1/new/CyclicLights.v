`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: HITSZ
// Engineer: Maxwell Jay
// 
// Create Date: 2024/06/11 22:35:41
// Design Name: 
// Module Name: CyclicLights
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


module CyclicLights(
    input clk,
    output [3:0] led
    );
    reg [26:0] divclk;
    reg cout_1s; // 1 Hz counter
    reg [3:0] led_timer; // 12 段计数器
    reg [3:0] led_reg;

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

    always @(posedge clk) begin
        if (cout_1s) begin
            if (led_timer < 12 - 1)
                led_timer <= led_timer + 1;
            else
                led_timer <= 0;
            
            case ({led_timer})
                4'b0000: led_reg <= 4'b1000;
                4'b0001: led_reg <= 4'b1100;
                4'b0010: led_reg <= 4'b1110;
                4'b0011: led_reg <= 4'b1111;
                4'b0100: led_reg <= 4'b1110;
                4'b0101: led_reg <= 4'b1100;
                4'b0110: led_reg <= 4'b1000;
                4'b0111: led_reg <= 4'b0000;
                4'b1000: led_reg <= 4'b1111;
                4'b1001: led_reg <= 4'b0000;
                4'b1010: led_reg <= 4'b1111;
                4'b1011: led_reg <= 4'b0000;
                default: led_reg <= 4'b0000;
            endcase
        end
    end

    assign led = led_reg;

endmodule

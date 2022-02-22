`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/12 21:49:44
// Design Name: 
// Module Name: Display
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


module Display(
    input clk,
    input [15:0] acc_data,
    output reg [7:0] sseg_ca,
    output reg [7:0] sseg_an
    );
    reg [3:0]disp_dat;
    reg [2:0]disp_bit;
    //150ms刷新时钟
    reg [14:0] sx;
    reg clk_sx;   
    always @ (posedge clk)
    begin
    //150ms刷新时钟
        if(sx==1500)
        begin
            clk_sx=~clk_sx;
            sx<=0;
        end
        else
            sx=sx+1;
    end
    always@(posedge clk)
    begin
        case(disp_dat)
        4'h0:sseg_ca=8'hc0;
        4'h1:sseg_ca=8'hf9;
        4'h2:sseg_ca=8'ha4;
        4'h3:sseg_ca=8'hb0;
        4'h4:sseg_ca=8'h99;
        4'h5:sseg_ca=8'h92;
        4'h6:sseg_ca=8'h82;
        4'h7:sseg_ca=8'hf8;
        4'h8:sseg_ca=8'h80;
        4'h9:sseg_ca=8'h90;
        4'ha:sseg_ca=8'h88;
        4'hb:sseg_ca=8'h83;
        4'hc:sseg_ca=8'hc6;
        4'hd:sseg_ca=8'ha1;
        4'he:sseg_ca=8'h86;
        4'hf:sseg_ca=8'h8e;
        default:sseg_ca=8'hff;
        endcase
    end
    always @ (posedge clk_sx)
    begin
        if(disp_bit>=3)
            disp_bit=0;
        else
            disp_bit=disp_bit+1;
        case(disp_bit)
            3'h0:
        begin
            sseg_an=8'b11111110;
            disp_dat=acc_data[3:0];
        end
        3'h1:
        begin
        sseg_an=8'b11111101;
        disp_dat=acc_data[7:4];
        end
        3'h2:
        begin
        sseg_an=8'b11111011;
        disp_dat=acc_data[11:8];
        end
        3'h3:
        begin
        sseg_an=8'b11110111;
        disp_dat=acc_data[15:12];
        end            
        default:
            begin
                sseg_an=8'b11111111;
                disp_dat=0; 
            end
        endcase

    end
endmodule

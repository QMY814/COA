`timescale 1ns / 1ps

module IR(
    input clk,
    input C4,
    input [7:0] mbr_data_h,
    output reg [7:0] ir_data=8'h00
    );
    always@(posedge clk)
    begin
        if(C4) ir_data<=mbr_data_h;
    end
endmodule

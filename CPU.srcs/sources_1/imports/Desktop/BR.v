`timescale 1ns / 1ps

module BR(
    input clk,
    input C10,
    input [15:0] mbr_data,
    output reg [15:0] br_data=16'h0000
    );
    always@(posedge clk)
    begin
        if(C10) br_data<=mbr_data;
    end
endmodule

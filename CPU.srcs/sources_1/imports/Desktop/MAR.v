`timescale 1ns / 1ps

module MAR(
    input clk,
    input C2,
    input C8,
    input [7:0] mbr_data_l,
    input [7:0] pc_data,
    output reg [7:0] ram_addr=8'h00
    );
    always@(posedge clk)
    begin
        if(C2) ram_addr<=pc_data;
        else if(C8) ram_addr<=mbr_data_l;
    end
endmodule

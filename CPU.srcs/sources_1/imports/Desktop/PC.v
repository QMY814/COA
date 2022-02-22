`timescale 1ns / 1ps

module PC(
    input clk,
    input C3,
    input rst,
    input C1,
    input [7:0] mbr_data_l,
    output reg [7:0] pc_data=8'h00
    );
    always@(posedge clk)
    begin
        if(rst) pc_data<=8'h00;    
        else if(C1) pc_data<=pc_data+1;
        else if(C3) pc_data<=mbr_data_l;
    end
    
endmodule

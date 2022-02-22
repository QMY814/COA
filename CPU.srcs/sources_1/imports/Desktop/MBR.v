`timescale 1ns / 1ps

module MBR(
    input clk,
    input C5,
    input C11,
    input [15:0] ram_data,
    input [15:0] acc_data,
    output reg [15:0] mbr_data=16'h0000
    //output [7:0] mbr_data_h,
    //output [7:0] mbr_data_l
    );
    
    always@(posedge clk)
    begin
        if(C5) mbr_data<=ram_data;
        else if(C11) mbr_data<=acc_data;
    end
    
  //  assign mbr_data_h=mbr_data[15:8];
   // assign mbr_data_l=mbr_data[7:0]; 
        
endmodule

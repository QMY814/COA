`timescale 1ns / 1ps

module ACC(
    input clk,
    input C9,
    input C6,//reset
    input signed [15:0] alu_data,
    output reg flag_jump,
    output reg signed [15:0] acc_data=16'h0000
    );
    always@(posedge clk)
    begin
        if(C6) acc_data<=0;
        else if(C9) acc_data<=alu_data;
        if(acc_data>=0) flag_jump<=1;
        else flag_jump<=0;
    end
endmodule

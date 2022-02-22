`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/06 22:42:09
// Design Name: 
// Module Name: sim
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


module sim(    );
    reg clk=0;
    reg rst=0;
    wire [15:0] result;
    myComputer dut(clk,rst,result);
    
    //Clock Stimulus
    initial 
    begin
        forever #5 clk=~clk;
    end
    
endmodule

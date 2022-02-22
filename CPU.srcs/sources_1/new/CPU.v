`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/19 11:47:21
// Design Name: 
// Module Name: CPU
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


module CPU(
    input clk,
    input rst,
//    output [15:0]output_data,
    input [15:0] mainmem_data,
    output [7:0] mainmem_addr,
    output [15:0] tomainmem_data,
    output write_en,
    output [7:0]sseg_ca,
    output [7:0]sseg_an
    );
    wire [15:0] mbr_data;
    //wire [15:0] memory_data;
    wire [7:0] mbr_data_h=mbr_data[15:8];
    wire [7:0] mbr_data_l=mbr_data[7:0];
    //wire [7:0] mar_data;
    wire [7:0] pc_data;
    wire [7:0] ir_data;
    wire [15:0] acc_data;
    wire [15:0] alu_data;
    wire [15:0] br_data;
    wire [3:0] ctrl_signal;
    wire C0,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,flag_jump,acc_rst;
    
//    assign output_data=acc_data;//ACC 作为输出
    assign tomainmem_data=mbr_data;
    assign write_en=C0&C12;
    assign acc_rst=C6|rst;
    
    //例化
    MBR myMBR(
    .clk(clk),
    .C5(C5),
    .C11(C11),
    .ram_data(mainmem_data),
    .acc_data(acc_data),
    .mbr_data(mbr_data)
    );
       
    MAR myMAR(
    .clk(clk),
    .C2(C2),
    .C8(C8),
    .mbr_data_l(mbr_data_l),
    .pc_data(pc_data),
    .ram_addr(mainmem_addr)
    );
    
   PC myPC(
        .clk(clk),
        .C3(C3),
        .rst(rst),
        .C1(C1),
        .mbr_data_l(mbr_data_l),
        .pc_data(pc_data)
        );
        
    IR myIR(
         .clk(clk),
         .C4(C4),
         .mbr_data_h(mbr_data_h),
         .ir_data(ir_data)
         );
         
     CU myCU(
           .flag_jump(flag_jump),
           .clk(clk),
           .ir_data(ir_data),
           .ctrl_signal(ctrl_signal),
           .C0(C0), .C1(C1), .C2(C2), .C3(C3), .C4(C4), .C5(C5), .C6(C6), .C7(C7), .C8(C8), .C9(C9), 
           .C10(C10), .C11(C11), .C12(C12)
            );
               
     BR myBR(
           .clk(clk),
           .C10(C10),
           .mbr_data(mbr_data),
           .br_data(br_data)
           );
           
      ALU myALU(
               .clk(clk),
               .br_data(br_data),
               .C7(C7),
               .acc_data(acc_data),
               .ctrl_signal(ctrl_signal),
               .alu_data(alu_data)
               );
               
      ACC myACC(
               .clk(clk),
               .C9(C9),
               .C6(acc_rst),//reset
               .alu_data(alu_data),
               .flag_jump(flag_jump),
               .acc_data(acc_data)
               );
     Display myDisplay(
        .clk(clk),
        .acc_data(acc_data),
        .sseg_ca(sseg_ca),
        .sseg_an(sseg_an)
     );      
endmodule

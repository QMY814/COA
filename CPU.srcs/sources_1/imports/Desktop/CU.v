`timescale 1ns / 1ps

module CU(
    input flag_jump,clk,
    input [7:0] ir_data,
    output  [3:0] ctrl_signal,
    output  C0,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11, C12
    );
    wire C13, C14, C15;
    wire [7:0] ctrl_addr;
    wire [19:0] ctrl_data;
    CAR myCAR(.clk(clk), .C13(C13), .C14(C14), .C15(C15), .ir_data(ir_data),
    .flag_jump(flag_jump),
    .car_data(ctrl_addr)
    );
    
    CBR myCBR(.ctrl_memory(ctrl_data),
    .C0(C0), .C1(C1), .C2(C2), .C3(C3), .C4(C4), .C5(C5), .C6(C6), .C7(C7), .C8(C8), .C9(C9), 
    .C10(C10), .C11(C11), .C12(C12), .C13(C13), .C14(C14), .C15(C15),
    .ctrl_signal(ctrl_signal)   
     ); 
       
     Control_Memory myControl_Memory (
         .clka(clk),    // input wire clka
         .addra(ctrl_addr),  // input wire [7 : 0] addra
         .douta(ctrl_data)  // output wire [19 : 0] douta
       );
    
endmodule

`timescale 1ns / 1ps

module myComputer(
    input clk,
    input rst,
//    output [15:0] result,
    output [7:0]sseg_ca,
    output [7:0]sseg_an
    );
    
    wire [15:0] write_bus;
    wire [15:0] read_bus;
    wire [7:0] mainmem_addr;
    wire write_en;
    
    CPU myCPU(
        .clk(clk),
        .rst(rst),
//        .output_data(result),
        .mainmem_data(read_bus),
        .mainmem_addr(mainmem_addr),
        .tomainmem_data(write_bus),
        .write_en(write_en),
        .sseg_ca(sseg_ca),
        .sseg_an(sseg_an)
        );
    
    Memory myMemory (
          .clka(clk),    // input wire clka
          .wea(write_en),      // input wire [0 : 0] wea
          .addra(mainmem_addr),  // input wire [7 : 0] addra
          .dina(write_bus),    // input wire [15 : 0] dina
          .douta(read_bus)  // output wire [15 : 0] douta
        );
    
endmodule
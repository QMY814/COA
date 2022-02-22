`timescale 1ns / 1ps

module CAR(
    input clk,
    input C13,
    input C14,
    input C15,
    input [7:0] ir_data,
    input flag_jump,
    output reg [7:0] car_data=8'h00
    );
    always@(posedge clk)
    begin
        if(C15) car_data<=8'h00;//'Reset
        else if(C14&&car_data!=8'h03&&car_data!=8'h06&&car_data!=8'h0A&&car_data!=8'h0E&&car_data!=8'h12&&car_data!=8'h14&&car_data!=8'h15&&car_data!=8'h19&&car_data!=8'h1D&&car_data!=8'h21&&car_data!=8'h25&&car_data!=8'h29&&car_data!=8'h2C&&car_data!=8'h2F&&car_data!=8'h32) 
        car_data<=car_data+1;//Increment
        else if(C13)
        begin
            case(ir_data)
                8'h01: car_data<=8'h04;//STORE X
                8'h02: car_data<=8'h07;//LOAD X
                8'h03: car_data<=8'h0B;//ADD X
                8'h04: car_data<=8'h0F;//SUB X
                8'h05: 
                begin
                    if(flag_jump) car_data<=8'h13;//JMPGEZ X
                    else car_data<=8'h14;//Not Jump
                end
                8'h06: car_data<=8'h13;//JUMP X
                8'h07: car_data<=8'h15;//HALT
                8'h08: car_data<=8'h16;//MPY X
                8'h09: car_data<=8'h1A;//DIV X
                8'h0A: car_data<=8'h1E;//AND X
                8'h0B: car_data<=8'h22;//OR X
                8'h0C: car_data<=8'h26;//NOT X
                8'h0D: car_data<=8'h2A;//SLL/SLA
                8'h0E: car_data<=8'h2D;//SRL
                8'h0F: car_data<=8'h30;//SRA
                8'h00: car_data<=8'h14;//FETCH OVER
                default:;
            endcase
        end
    end
endmodule

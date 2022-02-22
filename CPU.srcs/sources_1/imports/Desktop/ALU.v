`timescale 1ns / 1ps

module ALU(
input clk,
input signed [15:0] br_data,
input C7,
input signed [15:0] acc_data,
input [3:0] ctrl_signal,
output reg signed [15:0] alu_data=16'h0000
    );
    
    reg signed [15:0] DR=16'h0000;
    reg signed [15:0] MR=16'h0000;
    
    reg signed [15:0] acc_temp=16'h0000;
    reg signed [31:0] result_temp=32'h00000000;
    always@(posedge clk)
    begin
        if(C7) acc_temp<=acc_data;
        case(ctrl_signal)
            
            4'h1:    //ADD
            begin
                acc_temp=acc_temp+br_data;
                alu_data=acc_temp;
            end
            
            4'h2:   //SUB
            begin
                acc_temp=acc_temp-br_data;
                alu_data=acc_temp;
            end
            
            4'h3:   //MPY
            begin
                result_temp=acc_temp*br_data;
                acc_temp=result_temp[15:0];
                alu_data=acc_temp;
                MR=result_temp[31:16];
            end
            
            4'h4:   //DIV
            begin
                if(br_data)
                begin
                    DR=acc_temp%br_data;//ШЁгр
                    acc_temp=(acc_temp-DR)/br_data;
                    alu_data=acc_temp;
                end
            end
            
            4'h5:   //AND
            begin
                acc_temp=acc_temp&br_data;
                alu_data=acc_temp;
            end
            
            4'h6:   //OR
            begin
                acc_temp=acc_temp|br_data;
                alu_data=acc_temp;
            end
            
            4'h7:   //NOT
            begin
                acc_temp=~br_data;
                alu_data=acc_temp;
            end
            
            4'h8:   //SLL or SLA shift left logic/arithmetic
            begin
                acc_temp={acc_temp[14:0],1'b0};
                alu_data=acc_temp;
            end
            
            4'h9:  //SRL shift right logic
            begin
                acc_temp={1'b0,acc_temp[15:1]};
                alu_data=acc_temp;
            end
            
            4'hA://SRA shift right arithmetic
            begin
                acc_temp={acc_temp[15],acc_temp[15:1]};
                alu_data=acc_temp;
            end
            
            /*4'hf://reset
            begin
                acc_temp=16'h0000;
                alu_data=acc_temp;
            end*/
            
            default:;
        endcase
    end
    
endmodule


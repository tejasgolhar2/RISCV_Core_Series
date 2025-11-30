`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2025 09:08:29 PM
// Design Name: 
// Module Name: ALU_Control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 	The ALU COntrol is the control signal generator for the Control Unit of the CPU
// 			It takes in the ALUOp bits and few more bits from the input instruction and depending upon the 
//			respective values, the control signals are generated to operate the control unit.
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_Control(
	input wire 			fun7,
	input wire [2:0]	fun3,
	input wire [1:0]	ALUOp,
	output reg [3:0]	Control_out
    );

	always@(*)
	begin
		case({ALUOp, fun7, fun3})
			6'b00_0_000	: 	Control_out	= 4'b0010;
			6'b01_0_000	:	Control_out = 4'b0110;
			6'b10_0_000	:	Control_out	= 4'b0010;
			6'b10_1_000	: 	Control_out = 4'b0110;
			6'b10_0_111	:	Control_out	= 4'b0000;
			6'b10_0_110	:	Control_out	= 4'b0001;
			default		:	Control_out	= 4'b0000;	
		endcase
	end

endmodule

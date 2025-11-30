`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2025 08:09:53 AM
// Design Name: 
// Module Name: Immediate_generator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:		The Immediate Generator (ImmGen) in a RISC CPU such as RISC-V is 
//			responsible for extracting and sign-extending immediate values from instruction 
//			fields before they are fed into the ALU or Control Logic. 
// 
// Dependencies: 
// 				The opcode lets decide the type of input instruction in the Immediate Generator
//			For Branch Type Instruction, the LSB i.e., immed[11] == instruction[7] == 0
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Immediate_generator(
	input wire [6:0]	opcode,
	input wire [31:0]	instruction,
	output reg [31:0]	ImmExt
    );

	always@(*)
	begin
		case(opcode)
			//	Load Type Instruction
			7'b0000011 : 	ImmExt 	=	{ {20{instruction[31]}}, instruction[31:20]}; 						
			//	Store Type Instruction
			7'b0100011 :	ImmExt	=	{ {20{instruction[31]}}, instruction[31:25], instruction[11:7]};
			//	Branch Type Instruction
			7'b1100011 :	ImmExt	=	{ {20{instruction[31]}}, instruction[31:25], instruction[11:8], 1'b0};	
		endcase
	end

endmodule

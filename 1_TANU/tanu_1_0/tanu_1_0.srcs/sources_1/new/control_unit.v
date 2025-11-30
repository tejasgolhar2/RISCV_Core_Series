`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2025 11:55:10 AM
// Design Name: 
// Module Name: control_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//					The control unit (CU) intreprets instruction's opcode and generates 
//			the control signals to co-ordinate the activities of the datapath, ALU, memory and I/O.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module control_unit(
	input wire [6:0]	instruction,
	output reg 			Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite,
	output reg [1:0]	ALUOp
    );
	

	always@(*)
	begin
		case(instruction)
			
			//	R-type instruction
			7'b0110011: { ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b001000_10;
			//	Load-type instruction
			7'b0000011: { ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b111100_00;
			//	Store-type instruction
			7'b0100011: { ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b100010_00;
			//	Branch-type instruction
			7'b1100011: { ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b000001_01;
			
			default: 	{ ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b000000_00;

		endcase
	end

endmodule

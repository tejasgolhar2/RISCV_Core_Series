`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2025 05:28:42 PM
// Design Name: 
// Module Name: program_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//			A program counter is a special register in the computer's CPU that holds 
// 		the address of the next instruction to be executed.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module program_counter(
	input wire			clk,
	input wire			reset,
	input wire [31:0]	PC_in,
	output reg [31:0]	PC_out
    );

	always@(posedge clk or posedge reset)
	begin
		if (reset)
			PC_out	<=	32'b0;
		else
			PC_out	<=	PC_in;
	end


endmodule

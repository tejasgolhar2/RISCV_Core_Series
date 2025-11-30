`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2025 09:28:52 PM
// Design Name: 
// Module Name: Data_Memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description:	The memory that stores the data that program manipulates 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Data_Memory(
	input wire		clk,
	input wire		reset,
	input wire		MemWrite,
	input wire		MemRead,
	input wire [31:0] 	read_address, Write_data,	
	output wire [31:0]	MemData_out
    );

	reg [31:0]	D_Memory[63:0];
	integer k;

	always@(posedge clk or posedge reset)
	begin
		if (reset)
		begin
			for(k=0; k<64; k=k+1)
			begin
				D_Memory[k]	<=	32'b0;
			end
		end
		else if (MemWrite)
		begin
			D_Memory[read_address]	<=	Write_data;
		end
	end

	assign	MemData_out	= MemRead ? D_Memory[read_address] : 32'b0 ;

endmodule

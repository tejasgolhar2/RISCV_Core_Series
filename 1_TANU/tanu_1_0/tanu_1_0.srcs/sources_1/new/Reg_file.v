`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2025 06:19:01 PM
// Design Name: 
// Module Name: Reg_file
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


module Reg_file(
	input wire			clk, reset, RegWrite,
	input wire [4:0]	Dest_reg, Read_reg1, Read_reg2,
	input wire [31:0]	Write_data,

	output wire [31:0]	Read_data1, Read_data2

    );

	// Register Array - 32bit register array of 32 registers
	reg [31:0]	Registers [31:0];



	//	Initialize the Reg File with Random Decimal Values
	initial begin
		
		Registers[0]	=	2;
		Registers[1]	=	4;
		Registers[2]	=	21;
		Registers[3]	=	64;
		Registers[4]	=	33;
		Registers[5]	=	23;
		Registers[6]	=	7;
		Registers[7]	=	45;
		Registers[8]	=	75;
		Registers[9]	=	4;
		Registers[10]	=	3;
		Registers[11]	=	9;
		Registers[12]	=	5;
		Registers[13]	=	75;
		Registers[14]	=	55;
		Registers[15]	=	4;
		Registers[16]	=	39;
		Registers[17]	=	37;
		Registers[18]	=	46;
		Registers[19]	=	32;
		Registers[20]	=	61;
		Registers[21]	=	88;
		Registers[22]	=	54;
		Registers[23]	=	3;
		Registers[24]	=	0;
		Registers[25]	=	6;
		Registers[26]	=	22;
		Registers[27]	=	4;
		Registers[28]	=	46;
		Registers[29]	=	7;
		Registers[30]	=	9;
		Registers[31]	=	43;

	end


	integer k;

	always@(posedge clk or posedge reset)
	begin
		/*if (reset)
		begin
			for (k=0; k<32; k=k+1)
			begin
				Registers[k]	<=	32'b0;
			end
		end
		else
		begin*/
			if (RegWrite)
			begin
				Registers[Dest_reg]	<=	Write_data;
			end
		//end
	end

	assign Read_data1	=	Registers[Read_reg1];
	assign Read_data2	=	Registers[Read_reg2];

endmodule

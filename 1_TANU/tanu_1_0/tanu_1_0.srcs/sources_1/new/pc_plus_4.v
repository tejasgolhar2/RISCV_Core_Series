`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2025 05:35:15 PM
// Design Name: 
// Module Name: pc_plus_4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 		The module to increment to output of PC by a value of 4
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pc_plus_4
(
	input wire [31:0]	fromPC,
	output wire [31:0]	NextoPC

    );

	assign NextoPC 	=	fromPC + 4;

endmodule

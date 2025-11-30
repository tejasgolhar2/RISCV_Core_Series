`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2025 10:10:47 PM
// Design Name: 
// Module Name: AND_logic
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


module AND_logic(
	input wire	branch,
	input wire	zero,
	output wire	and_out
    );
	
	assign and_out	=	branch & zero;

endmodule

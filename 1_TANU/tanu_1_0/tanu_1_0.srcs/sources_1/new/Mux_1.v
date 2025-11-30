`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2025 10:07:10 PM
// Design Name: 
// Module Name: Mux_1
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


module Mux_12(
	input wire 			sel,
	input wire [31:0]	A, B,
    output wire [31:0]	Mux12_out	
	);
	
	assign	Mux12_out	=	sel == 1'b0 ? A : B;

endmodule

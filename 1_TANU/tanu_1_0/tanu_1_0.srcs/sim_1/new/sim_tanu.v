`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2025 10:53:31 PM
// Design Name: 
// Module Name: sim_tanu
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


module sim_tanu();


	reg clk, reset;

	top uut(
	
	.clk	(clk),
	.reset	(reset)

	);


	initial begin
	clk		=	0;
	reset	=	1;
	#5;

	reset	=	0;
	#400;
	end

	always begin
		#5 clk	=	~clk;		
	end

endmodule

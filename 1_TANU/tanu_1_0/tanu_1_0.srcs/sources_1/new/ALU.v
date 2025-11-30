`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2025 08:56:48 PM
// Design Name: 
// Module Name: ALU
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


module ALU(

	input wire [31:0]	A,B,
	input wire [3:0]	Control_in,
	output reg 			zero,
	output reg [31:0]	ALU_Result
    );

	always@(Control_in or A or B)
	begin
		case(Control_in)
			4'b0000: begin	zero	<=	0;	ALU_Result	<=	A & B;	end
			4'b0001: begin	zero	<=	0;	ALU_Result	<=	A | B;	end
			4'b0010: begin 	zero	<=	0;	ALU_Result	<=	A + B;	end
			4'b0110: begin	if(A==B) zero <= 1; else zero <= 0; ALU_Result <= A - B;	end
			default: begin	zero 	<= 0; 	ALU_Result 	<= 	0;		end
		endcase
	end

endmodule

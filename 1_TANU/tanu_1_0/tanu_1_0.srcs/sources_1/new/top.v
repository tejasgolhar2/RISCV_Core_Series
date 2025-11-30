`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2025 04:36:20 PM
// Design Name: 
// Module Name: top
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


module top(
	input wire			clk,
	input wire			reset

    );

	

	wire [31:0]		PC_top, instruction_top, Rd1_top, Rd2_top, ImmExt_top, ALUMux_top, Sum_out_top, NextoPC_top, PCin_top, address_top, MemData_top, WrData_top; 
	wire			RegWrite_top, ALUSrc_top, Branch_top, zero_top, and_out_top, MemtoReg_top, MemRead_top, MemWrite_top;
	wire [1:0]		ALUOp_top;
	wire [3:0]		Control_top;


	//----------	Program Counter  -----------------

		program_counter pc(
		.clk	(clk),
		.reset	(reset),
		.PC_in	(PCin_top),
		.PC_out	(PC_top)
		);
	

	//----------	PC Adder (Plus 4)	--------------

		pc_plus_4	PC_Adder(
		.fromPC		(PC_top),
		.NextoPC	(NextoPC_top)
		);


	//-----------	Instruction Memory	--------------

		instruction_memory Inst_Memory(
		.clk		(clk),
		.reset		(reset),
		.read_address		(PC_top),
		.instruction_out	(instruction_top)
		);

	//-----------	Register File 	-----------------

		Reg_file	Reg_File(
		.clk		(clk),
		.reset		(reset),
		.RegWrite	(RegWrite_top),
		.Dest_reg	(instruction_top[11:7]), 
		.Read_reg1	(instruction_top[19:15]), 
		.Read_reg2	(instruction_top[24:20]),
		.Write_data	(WrData_top),
		.Read_data1	(Rd1_top),
		.Read_data2	(Rd2_top)

		);	
	
	//-----------	Immediate Generator	-------------

		Immediate_generator Imm_Gen(
		.opcode		(instruction_top[6:0]),
		.instruction(instruction_top),
		.ImmExt		(ImmExt_top)
		);


	//-----------	Control Unit	-----------------

		control_unit Control_Unit(
		.instruction	(instruction_top[6:0]),
		.Branch		(Branch_top),
		.MemRead	(MemRead_top), 
		.MemtoReg	(MemtoReg_top), 
		.MemWrite	(MemWrite_top), 
		.ALUSrc		(ALUSrc_top), 
		.RegWrite	(RegWrite_top),
		.ALUOp		(ALUOp_top)
		);

	
	//-----------	ALU Control	--------------------

		ALU_Control ALU_Ctrl(
		.fun7	(instruction_top[30]),
		.fun3	(instruction_top[14:12]),
		.ALUOp	(ALUOp_top),
		.Control_out	(Control_top)
		);

	
	//-----------	ALU Unit ----------------------

		ALU	ALU(
		.A			(Rd1_top),
		.B			(ALUMux_top),
		.Control_in	(Control_top),
		.zero		(zero_top),
		.ALU_Result	(address_top)
		);

	
	//-----------	ALU Mux	-----------------------

		Mux_12	ALU_Mux(
		.sel		(ALUSrc_top),
		.A			(Rd2_top), 
		.B			(ImmExt_top),
		.Mux12_out	(ALUMux_top)	
		);

	//-----------	Adder	-----------------------

		Adder	Adder(
		.in_1		(PC_top),
		.in_2		(ImmExt_top),
		.Sum_out	(Sum_out_top)
		);

		
	//-----------	AND Gate	-------------------
	
		AND_logic AND_logic(
		.branch		(Branch_top),
		.zero		(zero_top),
		.and_out	(and_out_top)
		);
	
	//-----------	ADD MUX 	-------------------

		Mux_12 ADD_Mux(
		.sel		(and_out_top),
		.A			(NextoPC_top), 
		.B			(Sum_out_top),
		.Mux12_out	(PCin_top)	
		);


	//-----------	DATA Memory -------------------

		Data_Memory Data_Memory(
		.clk		(clk),
		.reset		(reset),
		.MemWrite	(MemWrite_top),
		.MemRead	(MemRead_top),
		.read_address	(address_top), 
		.Write_data		(Rd2_top),	
		.MemData_out	(MemData_top)
		);		

	//----------	Memory MUX -------------------

		Mux_12 MEM_Mux(
		.sel		(MemtoReg_top),
		.A			(address_top), 
		.B			(MemData_top),
		.Mux12_out	(WrData_top)	
		);


endmodule

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:15:46 01/29/2024
// Design Name:   fightingGameForFPGA
// Module Name:   D:/LogicProj/Logic_Proj/testfpga.v
// Project Name:  Logic_Proj
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fightingGameForFPGA
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testfpga;

	// Inputs
	reg clk;
	reg [2:0] action1;
	reg [2:0] action2;
	reg actionEnable;
	reg resetGame;

	// Outputs
	wire [1:0] health1;
	wire [1:0] health2;
	wire firstWin;
	wire secondWin;
	wire [2:0] state1;
	wire [2:0] state2;

	// Instantiate the Unit Under Test (UUT)
	fightingGameForFPGA uut (
		.health1(health1), 
		.health2(health2), 
		.firstWin(firstWin), 
		.secondWin(secondWin), 
		.state1(state1), 
		.state2(state2), 
		.clk(clk), 
		.action1(action1), 
		.action2(action2), 
		.actionEnable(actionEnable), 
		.resetGame(resetGame)
	);

	 initial
        begin
            
            clk = 0;
            resetGame = 0;
            #5 resetGame = 1; 
            repeat (10000000)
            #12.5 clk = ~clk;
            $finish;
        end
    
    //start action    
    initial
        begin
				actionEnable = 0;
            action1 = 3'b110;
            action2 = 3'b100;
				#30
				actionEnable = 1;
				
            #30
				actionEnable = 0;
            action1 = 3'b110;
            action2 = 3'b100;
				#30
				actionEnable = 1;
				
            #30
				actionEnable = 0;
            action1 = 3'b001;
            action2 = 3'b011;
				#30
				actionEnable = 1;
				
            #30
				actionEnable = 0;
            action1 = 3'b001;
            action2 = 3'b000;
				#30
				actionEnable = 1;
            
				#30
				actionEnable = 0;
            action1 = 3'b001;
            action2 = 3'b001;
				#30
				actionEnable = 1;
				
            #30
				actionEnable = 0;
            action1 = 3'b110;
            action2 = 3'b010;
				#30
				actionEnable = 1;
				
            #30
				actionEnable = 0;
            action1 = 3'b011;
            action2 = 3'b010;
				#30
				actionEnable = 1;
				
            #30
				actionEnable = 0;
            action1 = 3'b001;
            action2 = 3'b000;
				#30
				actionEnable = 1;
            
				#30
				actionEnable = 0;
            action1 = 3'b000;
            action2 = 3'b011;
				#30
				actionEnable = 1;
				
            #30
				actionEnable = 0;
            action1 = 3'b100;
            action2 = 3'b000;
				#30
				actionEnable = 1;
				
            #30
				actionEnable = 0;
            action1 = 3'b000;
            action2 = 3'b100;
				#30
				actionEnable = 1;
        end
      
endmodule


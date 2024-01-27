module fightingGameForFPGA(SEG_SEL, SEG_DATA, firstWin, secondWin, state1,
    state2, clk, action1, action2, actionEnable, resetGame);
    output[4:0] SEG_SEL;
    output[7:0] SEG_DATA;
    output firstWin;
    output secondWin;
    output[2:0] state1;
    output[2:0] state2;
    input clk;
    input[2:0] action1;
    input[2:0] action2;
    input actionEnable;
    input resetGame;

    wire clkForSeg;
    wire[1:0] health1, health2;
    reg isGameOver = 1'b0;
    reg firstWin = 1'b0, secondWin = 1'b0;
    reg[2:0] currentState1 = 3'b100, currentState2 = 3'b001;
    freqDividerForSevenSegment f1(clk, clkForSeg);
    SevenSeg f2(clkForSeg, health1, health2, SEG_SEL, SEG_DATA);
    firstPlayer p1(clk, isGameOver, resetGame, actionEnable, action1, state1, action2, currentState2, health1);
    secondPlayer p2(clk, isGameOver, resetGame, actionEnable, action1, currentState1, action2, state2, health2);

    always @ (negedge resetGame or negedge health1 or negedge health2 or posedge actionEnable)
        if (resetGame == 0) begin
            firstWin <= 1'b0;
            secondWin <= 1'b0;
            isGameOver <= 1'b0;
            currentState1 <= 3'b100;
            currentState2 <= 3'b001;
        end
        else if(health1 == 0) begin
            secondWin <= 1'b1;
            isGameOver <= 1'b1;
        end
        else if(health2 == 0) begin
            firstWin <= 1'b1;
            isGameOver <= 1'b1;
        end
        else if (actionEnable) begin
            currentState1 <= state1;
            currentState2 <= state2;
        end
    

endmodule
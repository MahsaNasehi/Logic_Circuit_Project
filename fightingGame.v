`include "player1.v"
`include "player2.v"
module fightingGame(
    output[1:0] health1,
    output[1:0] health2,
    output firstWin,
    output secondWin,
    output[2:0] state1,
    output[2:0] state2,
    input clk,
    input[2:0] action1,
    input[2:0] action2,
    input actionEnable,
    input resetGame
);
    
    reg[2:0] state1 = 3'b100, state2 = 3'b001;
    reg firstWin = 1'b0, secondWin = 1'b0;
    reg[1:0] health1;
    reg[1:0] health2;



    always @ (posedge enable or negedge resetGame)
        if(resetGame == 0)begin
            state1 = 3'b100;
            state2 = 3'b001;

            firstWin = 1'b0;
            secondWin = 1'b0;

            health1 = 2'b11;
            health2 = 2'b11;
        end    
        if(~secondWin && ~firstWin) begin
            player1 p1(clk, action1, state1, action2, state2, health1);
            player2 p2(clk, action1, state1, action2, state2, health2);
        end

    
    always @ (negedge health1 or negedge health2)    
        if(health1 == 2'00)
            secondWin = 1'b1;
        else if(health2 == 2'b00)
            firstWin = 1'b1;    

endmodule
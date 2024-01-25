`include "player1.v"
`include "player2.v"
module fightingGame(
    output[1:0] health1,
    output[1:0] health2,
    input clk,
    input[2:0] action1,
    input[2:0] action2
);
    reg[2:0] state1 = 3'b100, state2 = 3'b001;
    player1 p1(clk, action1, state1, action2, state2, health1);
    player2 p2(clk, action1, state1, action2, state2, health2);
endmodule
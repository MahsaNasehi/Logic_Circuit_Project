<<<<<<< HEAD
module firstPlayer(input action1, input action2, input state2, output health);
=======
module firstPlayer(clk, action1, action2, state2, health);
    input[2:0] action1, action2, state2;
    input clk;
    output[1:0] health;
    reg[1:0] health = 2'b11;
    reg[1:0] wait_count = 2'b00;
>>>>>>> 611e123704e8e3fe0e1cb7bcf492af125f4587aa
    parameter player1S0 = 3'b100, player1S1 = 3'b010, player1S2 = 3'b001,
              player2S0 = 3'b001, player2S1 = 3'b010, player2S2 = 3'b100;  
    parameter kick = 3'b000,
              punch = 3'b001,
              await = 3'b010,
              jump = 3'b011,
              left1 = 3'b100,
              left2 = 3'b101,
              right1 = 3'b110,
              right2 = 3'b111;
    reg [2:0] state = player1S0;
    always @ (posedge clk)
        case(state)
            player1S0:
                if (action1 == right1 || action1 == right2)
                    assign state = player1S1;
                //else nothing to do, state doesn't change

            player1S1:
                if (action1 == right1 || action1 == right2) begin
                    state = player1S2;
                    if (action2 == kick && state2 == player2S1) 
                        health = health - 2'b01;
                    else if (action2 == punch && state2 == player2S2) 
                        health = health - 2'b10;
                end
                // if ((action1 == kick || action1 == punch || 
                //    action1 == wait || action1 == jump) && 
                //    (action2 == punch || action2 == wait ||
                //    action2 == jump || action2 == left ||
                //    action2 == right))
                //     //no changes 
                // else if((action1 == punch || action1 == wait ||
                //  action1 == jump) && (action2 == kick))
                //     //no changes 

                // else if(action1 == kick && action2 == kick && (state2 == player2S0 || state2 == player2S1))
                //     //no change 
                else if ((action1 == left1 || action1 == left2) || 
                        (action1 == kick && action2 == kick && state2 == player2S2))
                    assign state = player1S0;
                   
                 
            player1S2:
                if ((action1 == left1 || action1 == left2) ||
                    (action1 == punch && action2 == punch && state2 == player2S2)||
<<<<<<< HEAD
                    (action1 == kick && action2 == kick && state2 != player2S0)){
                        state = player1S1;
                    }

                else //S2 be khodesh    

=======
                    (action1 == kick && action2 == kick && state2 != player2S0))
                        assign state = player1S1;
                        
>>>>>>> 611e123704e8e3fe0e1cb7bcf492af125f4587aa
        endcase    

knbgtg

endmodule
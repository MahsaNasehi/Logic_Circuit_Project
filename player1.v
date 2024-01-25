module firstPlayer(input action1, input action2, input state2, output health);

    parameter player1S0 = 3'b100, player1S1 = 3'b010, player1S2 = 3'b001,
              player2S0 = 3'b001, player2S1 = 3'b010, player2S2 = 3'b100;  
    parameter kick = 3'b000,
              punch = 3'b001,
              wait = 3'b010,
              jump = 3'b011,
              left = //TODO,
              right = //TODO  
    assign health = 2'b11;
    reg [2:0] state;
    assign state = player1S0;
    always @ (posedge clk)
        case(state)
            S0:
                if(action1 == right)
                    assign state = player1S1;
                //else nothing to do, state doesn't change

            S1:
                if((action1 == kick || action1 == punch || 
                   action1 == wait || action1 == jump) && 
                   (action2 == punch || action2 == wait ||
                   action2 == jump || action2 == left ||
                   action2 == right))
                    //no changes 
                else if((action1 == punch || action1 == wait ||
                 action1 == jump) && (action2 == kick))
                    //no changes 

                else if(action1 == kick && action2 == kick && (state2 == player2S0 || state2 == player2S1))
                    //no change 
                else if((action1 == left) || 
                        (action1 == kick && action2 == kick && state2 == player2S2))

                    assign state = player1S0;
                else{
                    state = player1S2;
                    if(action1 == right && action2 == kick && state2 player2S1){
                        health--;
                    }
                    if(action1 == right && action2 == punch && state2 == player2S2){
                        health -= 2;
                    }    
                }    
                 
            S2:
                if((action1 == left) ||
                    (action1 == punch && action2 == punch && state2 == player2S2)||
                    (action1 == kick && action2 == kick && state2 != player2S0)){
                        state = player1S1;
                    }

                else //S2 be khodesh    

        endcase    


endmodule
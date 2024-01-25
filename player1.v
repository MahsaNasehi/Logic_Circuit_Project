module firstPlayer(input action1, input action2, input state2, output health);

    parameter S0 = 3'b100, S1 = 3'b010, S2 = 3'b001;
    parameter kick = 3'b000,
              punch = 3'b001,
              wait = 3'b010,
              jump = 3'b011,
              left = //TODO  
    assign health = 2'b11;
    reg [2:0] state;
    assign state = S0;
    always @ (posedge clk)
        case(state)
            S0:
                if
            S1:

            S2:

        endcase    


endmodule
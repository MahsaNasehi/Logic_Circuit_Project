module SevenSeg(clk, hp1, hp2, SEG_SEL, SEG_DATA);

	input clk;
	input [1:0] hp1;
	input [1:0] hp2;
	output reg [4:0] SEG_SEL;
	output reg [7:0] SEG_DATA;
	reg control=0;

	always @ (posedge clk)
	begin
		if(control)
		begin
			case(hp1)
				2'b00 : SEG_DATA = 8'b00111111;
				2'b01 : SEG_DATA = 8'b00000110;
				2'b10 : SEG_DATA = 8'b01011011;
				2'b11 : SEG_DATA = 8'b01001111;
			endcase
			SEG_SEL=5'b01000;
		end
		else
		begin
			case(hp2)
				2'b00 : SEG_DATA = 8'b00111111;
				2'b01 : SEG_DATA = 8'b00000110;
				2'b10 : SEG_DATA = 8'b01011011;
				2'b11 : SEG_DATA = 8'b01001111;
			endcase
			SEG_SEL=5'b00001;
		end
		control = ~control;
	end
endmodule
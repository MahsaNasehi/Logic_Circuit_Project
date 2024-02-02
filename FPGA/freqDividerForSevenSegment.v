module freqDividerForSevenSegment (clkIn, clkOut);
	input clkIn;
	output clkOut;
	reg clkOut;
	reg[25:0] counter=0;
	always @ (posedge clkIn)
	begin
		if(counter == 100000 - 1)
		begin
			counter <= 0;
			clkOut <= ~clkOut;
		end
		else
		begin
			counter <= counter+1;
		end
	end

endmodule
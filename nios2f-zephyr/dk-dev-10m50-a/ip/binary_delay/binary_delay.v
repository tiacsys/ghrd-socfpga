// Legal Notice: (C)2017 RocketBoards.org. All rights reserved.

module binary_delay
#(
	parameter WIDTH	= 32	// set to be the most significant bit until count
)
(
	input	wire 		clk,
	input	wire		reset_n,
	output	wire		data_out_n
);

	reg [WIDTH:0]		data_cnt;

	// Reset if needed, or increment if counting is not overflow
	always @ (posedge clk or negedge reset_n)
	begin
		if (!reset_n)
			data_cnt <= WIDTH + 1'b0;
		else if (data_cnt[WIDTH] == 1'b0)
			data_cnt <= data_cnt + 1'b1;
		else
			data_cnt <= data_cnt;
	end

	assign	data_out_n = !data_cnt[WIDTH-1];

endmodule

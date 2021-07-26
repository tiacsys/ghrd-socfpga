// Legal Notice: (C)2017 RocketBoards.org. All rights reserved.

module bit_syncin_debouncer
#(
	parameter WIDTH	= 32	// set to be the width of debounce counter
)
(
	input	wire 		clk,
	input	wire		data_in_n,
	output	wire		data_out_n
);

	reg			data_r1, data_r2, data_n ;
	reg [WIDTH-1:0]		data_db_cnt;	// debounce counter

	always @ (posedge clk)
	begin	// this should create a long pulse clock
		if (data_db_cnt[WIDTH-1])
		begin
			data_db_cnt <= #1 'd0;
		end
		else
		begin
			data_db_cnt <= #1 data_db_cnt + 'd1;
		end

		// debounce and double register
		if (data_db_cnt[WIDTH-1])
		begin  // use data_db_cnt[WIDTH-1] as an enable
			data_r1 <= #1 data_in_n;
			data_r2 <= #1 data_r1;

			if (data_r2 == data_r1)
			begin
				data_n <= #1 data_r2;
			end
			else
			begin
				data_n <= #1 1'b0; // keep in reset
			end
		end
	end

	assign data_out_n = data_n;

endmodule

// Quartus Prime Verilog Template
// Binary counter

module binary_counter
#(
	parameter WIDTH	= 32	// set to be the width of register being count
)
(
	input	wire 		clk,
	input	wire		enable_n,
	input	wire		reset_n,
	output	wire		data_out_msb,
	output	reg [WIDTH-1:0]	data_cnt
);

	// Reset if needed, or increment if counting is enabled
	always @ (posedge clk or negedge reset_n)
	begin
		if (!reset_n)
			data_cnt <= 'h0;
		else if (!enable_n)
			data_cnt <= data_cnt + 1'b1;
	end
	
	assign	data_out_msb = data_cnt[WIDTH-1];

endmodule

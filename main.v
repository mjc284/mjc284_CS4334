module main(	
	input clk, //50 MHz
	
	output dac1_sdata,
	output dac1_sclk,
	output dac1_lrck,
	output dac1_mclk
	);
	
	reg [24:0] clk_buf;
	always @(posedge clk)
		clk_buf <= clk_buf + 1;
	

	wire [23:0] dac1_data_L = clk_buf[24:1];
	wire [23:0] dac1_data_R = clk_buf[24:1];

	
	driver Driver1_inst(
	.clk(clk),
	.data_L(dac1_data_L),
	.data_R(dac1_data_R),
	
	.sdata(dac1_sdata),
	.sclk(dac1_sclk),
	.lrck(dac1_lrck),
	.mclk(dac1_mclk)
	);	
	
endmodule

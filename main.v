module main(	
	input clk, //50 MHz
	
	output dac1_sdata,
	output dac1_sclk,
	output dac1_lrck,
	output dac1_mclk
	);
	
	
	

	wire testing = clk_buf[1];
	
	
	assign buzzer = 1;
	

	
	driver Driver1_inst(
	.clk(clk),
	.data_L,
	.data_R,
	
	.sdata(dac1_sdata),
	.sclk(dac1_sclk),
	.lrck(dac1_lrck),
	.mclk(dac1_mclk)
	);	
	
endmodule

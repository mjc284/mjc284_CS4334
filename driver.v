module driver(
	input clk,
	input [23:0] data_L,
	input [23:0] data_R,
	
	output sdata,
	output sclk,
	output lrck,
	output mclk
	);
	
	reg [9:0] clk_buf;
	always @(posedge clk)
		clk_buf <= clk_buf + 1;
	
	wire [23:0] output_left = data_L - 24'h800000;
	wire [23:0] output_right = data_R - 24'h800000;
	
	assign lrck = clk_buf[9];
	assign mclk = clk_buf[1];
	assign sclk = !clk_buf[1];
	
	reg reg_lrck;
	reg [24:0] reg_output;
	always @(posedge clk_buf[1]) begin
		reg_lrck <= lrck;
		case({lrck, reg_lrck})
			0: reg_output <= {reg_output[23:0], 1'b0};
			1: reg_output <= {1'b0, output_left};
			2: reg_output <= {1'b0, output_right};
			3: reg_output <= {reg_output[23:0], 1'b0};
		endcase
	end
		
	assign sdata = reg_output[24];
	
endmodule
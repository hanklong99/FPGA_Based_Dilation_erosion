`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/08/27 10:54:08
// Design Name: 
// Module Name: Median_Filter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Median_Filter(
	input 					clk,//50Mhz
	input 					rst_n,
	input					per_clken,
	input                   per_vsync,
	input			[7:0]	per_img_Y,		
	
	output					post_clken,
	output                  post_vsync,
	output			[7:0]	post_img_Y
	//output	reg 	[15:0]	ram_addr

);

//---------------------------------------------------------------------------
//产生3x3阵列
wire 	[7:0] 	matrix_p11, matrix_p12, matrix_p13;//3x3 materix output 
wire 	[7:0]	matrix_p21, matrix_p22, matrix_p23;
wire 	[7:0]	matrix_p31, matrix_p32, matrix_p33;
wire 			matrix_clken, matrix_vsync;

Shift_RAM_3X3 u_Shift_RAM_3X3(
	//global signals
	.clk								(clk),
	.rst_n								(rst_n),
	//Image data prepred to be processd
	.per_clken							(per_clken),	//Prepared Image data output/capture enable clock
	.per_vsync                          (per_vsync),
	.per_img_Y							(per_img_Y),	//Prepared Image brightness input

	//Image data has been processd
	.matrix_clken						(matrix_clken),	//Prepared Image data output/capture enable clock	
	.matrix_vsync                       (matrix_vsync),
	.matrix_p11							(matrix_p11),
	.matrix_p12							(matrix_p12),
	.matrix_p13							(matrix_p13),	//3X3 Matrix output
	.matrix_p21							(matrix_p21),
	.matrix_p22							(matrix_p22),
	.matrix_p23							(matrix_p23),
	.matrix_p31							(matrix_p31),
	.matrix_p32							(matrix_p32),
	.matrix_p33							(matrix_p33)
);	

//-----------------------------------------------------
//Median_filter_3x3 lag 3clk
wire 	[7:0] 	mid_data;
Median_filter_3x3 u_Median_filter_3x3(
	.clk								(clk),
	.rst_n								(rst_n),
	.data11								(matrix_p11),
	.data12								(matrix_p12), 
	.data13								(matrix_p13),
	.data21								(matrix_p21), 
	.data22								(matrix_p22), 
	.data23								(matrix_p23),
	.data31								(matrix_p31),
	.data32								(matrix_p32), 
	.data33								(matrix_p33),
	.target_data						(mid_data)
);

//-------------------------------------------
//per_clken delay 3clk	
reg 	[2:0]	per_clken_r;
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)
		per_clken_r <= 3'b0;
	else 
		per_clken_r <= {per_clken_r[1:0], matrix_clken};
end

assign	post_clken 	= 	per_clken_r[2];

reg 	[2:0]	per_vsync_r;
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)
		per_vsync_r <= 3'b0;
	else 
		per_vsync_r <= {per_vsync_r[1:0], matrix_vsync};
end

assign	post_vsync 	= 	per_vsync_r[2];
	
/* //-------------------------------------------------------
//ram_addr
always @(posedge clk or negedge rst_n)begin	
	if(!rst_n)
		ram_addr <= 'd0;
	else if(post_clken == 1'b1)
		ram_addr <= ram_addr + 1'b1;
	else
		ram_addr <= ram_addr;
end	 */	

assign	post_img_Y	= mid_data;

endmodule 

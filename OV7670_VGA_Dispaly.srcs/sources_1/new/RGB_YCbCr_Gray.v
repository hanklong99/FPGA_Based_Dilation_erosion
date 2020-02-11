`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: NingHeChuan
// 
// Create Date: 2017/08/20 15:57:44
// Design Name: 
// Module Name: RGB_YCbCr_Gray
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


module RGB_YCbCr_Gray(
input [9:0] lcd_x,
input [9:0] lcd_y,
	input 			 	clk,
	input 			 	rst_n,
	input 				per_clken,
	input               per_vsync,
	//others		
	input 		[7:0]	cmos_R,//data_byte[7:5]
	input		[7:0]	cmos_G,//data_byte[4:2]
	input 		[7:0]	cmos_B,//data_byte[1:0]
	output				post_clken,
	output              post_vsync,
	output	 reg 	[7:0]	gray_data     
    );


always @ (posedge clk or negedge rst_n) begin
      if (!rst_n)
         gray_data[7:0] <= 8'b0000_0000;
      else if (cmos_R[7:3] >= 5'b10000)
         gray_data[7:0] <= 8'b1111_1111;
      else
         gray_data[7:0] <= 8'b0000_0000;
end



assign	post_clken 	= 	per_clken;
assign  post_vsync  =   per_vsync;


endmodule

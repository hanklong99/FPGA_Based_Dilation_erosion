`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/08/29 17:06:12
// Design Name: 
// Module Name: Img Processor
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


module Img_Processor(
input [9:0] lcd_x,
input [9:0] lcd_y,
	input 					clk,//25Mhz
	input                   vsync,//modified
	input 					rst_n,
	input					per_clken,
	input			[15:0]	per_data,		
	output	    			post_clken,
	output			[15:0]	post_data,
	output 	[16:0]	ram_addr,//modified,
	output                  post_vsync,//modified,
	output  [11:0]  x_min,
    output  [11:0]  x_max,
    output  [11:0]  y_min,
    output  [11:0]  y_max,
    
	output      [15:0]  points
    );

//---------------------------------------------------
//RGB_YCbCr_Skin_Dection
//wire	[7:0]	cmos_R = {per_data[15:11], per_data[15:13]};
//wire	[7:0]	cmos_G = {per_data[10:5], per_data[10:9]};
//wire	[7:0]	cmos_B = {per_data[4:0], per_data[4:2]};
wire	[7:0]	gray_data;
assign gray_data = per_data[15:8];
//wire 			post_clken_Gray;
//wire            post_vsync_Gray;

//Mean_Filer
wire	[7:0]	per_data_Median = gray_data;

wire	[7:0]	post_data_Median;
wire post_vsync_Median;
wire post_clken_Median;
//Sobel_Edge_Detect
wire 	[7:0]	per_data_Sobel = post_data_Median;

wire 	[10:0]	sobel_threshold = 100;//sobel_threshold
wire 			post_bit_Sobel;

//dilation
wire post_vsync_dialtion;
wire post_clken_dilation;
wire [7:0] post_data_dilation;

//erosion
wire post_vsync_erosion;
wire post_clken_erosion;
wire [7:0] post_data_erosion;

//position
wire post_vsync_Position;
wire post_clken_Position;
wire [7:0] post_data_Position;


//-------------------------------------------------------
//RGB_YCbCr_Gray
//RGB_YCbCr_Gray u_RGB_YCbCr_Gray(
//.lcd_x(lcd_x),
//.lcd_y(lcd_y),
//	.clk			(clk),
//	.rst_n			(rst_n),
//	.per_clken		(per_clken ),
//	.per_vsync      (vsync),
//	.cmos_R			(cmos_R),
//	.cmos_G			(cmos_G),
//	.cmos_B			(cmos_B),
//	.post_clken		(post_clken_Gray),
//	.post_vsync     (post_vsync_Gray),
//	.gray_data		(gray_data),
//	.points         ( )
//    );	

/**/
//--------------------------------------------------------------
//Median_Filter
Median_Filter Median_Filter_inst(
	.clk				(clk),//50Mhz
	.rst_n				(rst_n),
	.per_clken			(per_clken),
	.per_vsync          (vsync),
	.per_img_Y			(per_data_Median),	
	.post_clken			(post_clken_Median),
	.post_img_Y			(post_data_Median),
	.post_vsync         (post_vsync_Median)
);

//--------------------------------------------------------------
//dilation
dilation dilation_inst(
	.clk				(clk),//50Mhz
	.rst_n				(rst_n),
	.per_clken			(post_clken_Median),
	.per_vsync          (post_vsync_Median),
	.per_img_bit		(post_data_Median),	
	.post_clken			(post_clken_dilation),
	.post_vsync         (post_vsync_dilation),
	.post_img_bit		(post_data_dilation)
);

//--------------------------------------------------------------
//erosion
erosion erosion_inst(
	.clk				(clk),//50Mhz
	.rst_n				(rst_n),
	.per_clken			(post_clken_dilation),
	.per_vsync          (post_vsync_dilation),
	.per_img_bit		(post_data_dilation),	
	.post_clken			(post_clken_erosion),
	.post_vsync         (post_vsync_erosion),
	.post_img_bit		(post_data_erosion)
);

//--------------------------------------------------------------
//Sobel_Edge_Detect
//Sobel_Edge_Detect Sobel_Edge_Detect_inst(
//	.clk				(clk),
//	.rst_n				(rst_n),
//	.per_img_Y			(gray_data),
//	.per_clken			(post_clken_Gray),
//	.per_vsync          (post_vsync_Gray),
//	.sobel_threshold	(sobel_threshold),
//	.post_img_bit		(post_bit_Sobel),
//	.post_clken			(post_clken),
//	.post_vsync         (post_vsync)
//    );

//position position_inst(
//    .clk                    (clk             ),
//    .rst_n                  (rst_n           ),
////    .per_frame_vsync        (post_vsync_Median ),
////    .per_frame_href         (),
////    .per_frame_clken        (post_clken_Median ),
////    .per_img_Bit            (post_data_Median     ),

//    .per_frame_vsync        (post_vsync_dilation ),
//    .per_frame_href         (),
//    .per_frame_clken        (post_clken_dilation ),
//    .per_img_Bit            (post_data_erosion     ),
    
////    .per_frame_vsync        (post_vsync_erosion ),
////    .per_frame_href         (),
////    .per_frame_clken        (post_clken_erosion ),
////    .per_img_Bit            (post_data_erosion ),
    
//    .post_frame_vsync       (post_vsync_Position),
//    .post_frame_href        (),
//    .post_frame_clken       (post_clken_Position),
//    .x_min_f                  (x_min),
//    .x_max_f                  (x_max),
//    .y_min_f                  (y_min),
//    .y_max_f                  (y_max),
////    .x_min                  (x_min),
////    .x_max                  (x_max),
////    .y_min                  (y_min),
////    .y_max                  (y_max),
//    .lcd_x                  (lcd_x),
//	.lcd_y                  (lcd_y),
//    .post_img               (post_data_Position)
//    );
assign post_data = {post_data_erosion[7:3], post_data_erosion[7:2], post_data_erosion[7:3]};
//assign 	post_data 	= 	{gray_data[7:3], gray_data[7:2], gray_data[7:3]};//Gray
//assign 	post_data 	= 	{post_data_Position[7:3], post_data_Position[7:2], post_data_Position[7:3]};//Median
assign post_vsync = post_vsync_erosion;
assign post_clken = post_clken_erosion;
//assign 	post_data 	= 	~{16{post_bit_Sobel}};//Sobel_Edge_Detect

//assign	post_clken	=	post_clken_Gray;
//-------------------------------------------------------
//ram_addr

//always @(posedge clk or negedge rst_n)begin	
//	if(!rst_n)
//		ram_addr <= 'd0;
//	else if(post_clken == 1'b1)
//		ram_addr <= ram_addr + 1'b1;
//	else
//		ram_addr <= ram_addr;
//end	

endmodule

`timescale      1ns/1ns
// *********************************************************************************
// Project Name :       
// Author       : NingHeChuan
// Email        : ninghechuan@foxmail.com
// Blogs        : http://www.ninghechuan.com/
// File Name    : .v
// Module Name  :
// Called By    :
// Abstract     :
//
// CopyRight(c) 2018, NingHeChuan Studio.. 
// All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date         By              Version                 Change Description
// -----------------------------------------------------------------------
// 2019/3/4    NingHeChuan       1.0                     Original
//  
// *********************************************************************************

module Video_Image_Processor
(
	//global clock
	input				clk,  		  
	input				rst_n,		 

	//Image data prepred to be processd
	input				per_frame_vsync, 
	input				per_frame_href,	 
	input				per_frame_clken, 
	input		[15:0]  per_img,

	//Image data has been processd
	output				post_frame_vsync, 
	output				post_frame_href, 
	output				post_frame_clken,
    output      [11:0]  x_min,
    output      [11:0]  x_max,
    output      [11:0]  y_min,
    output      [11:0]  y_max, 
    input 			[11:0]	lcd_x,
	input 			[11:0]	lcd_y,
	output		[15:0]	post_img
);

//-------------------------------------------------------
//RGB888_YCbCr444
//Image data has been processd
wire			post_gray_vsync;
wire			post_gray_href;
wire			post_gray_clken;
wire	[0:0]	post_img_Y;
//wire	[7:0]	post_img_Cb;
//wire	[7:0]	post_img_Cr;

//--------------------------------------------------------------
//
RGB565_YCbCr_gray u_RGB565_YCbCr_gray(
	.clk					(clk),//COMS pixel clk 24Mhz
	.rst_n					(rst_n),
	.cmos_R					(per_img[15:11]),
	.cmos_G					(per_img[10:5]),
	.cmos_B					(per_img[4:0]),
	.per_frame_clken		(per_frame_clken),
	.per_frame_vsync		(per_frame_vsync),
	.per_frame_href			(per_frame_href),
	.img_Y						(post_img_Y),
	.img_Cb						(),
	.img_Cr						(),
	.post_frame_clken		(post_gray_clken),
	.post_frame_vsync		(post_gray_vsync),
	.post_frame_href		(post_gray_href)
);

//--------------------------------------
//Bit Image Process with Erosion before Dilation Detector.
wire			post2_frame_vsync;	//Processed Image data vsync valid signal
wire			post2_frame_href;	//Processed Image data href vaild  signal
wire			post2_frame_clken;	//Processed Image data output/capture enable clock
wire			post2_img_Bit;		//Processed Image Bit flag outout(1: Value, 0:inValid)
VIP_Bit_Erosion_Detector VIP_Bit_Dilation_Detector_inst
(
	//global clock
	.clk					(clk),  				//cmos video pixel clock
	.rst_n					(rst_n),				//global reset

	//Image data prepred to be processd
	.per_frame_vsync		(post_gray_vsync),	//Prepared Image data vsync valid signal
	.per_frame_href			(post_gray_href),		//Prepared Image data href vaild  signal
	.per_frame_clken		(post_gray_clken),	//Prepared Image data output/capture enable clock
	.per_img_Bit			(post_img_Y),		//Processed Image Bit flag outout(1: Value, 0:inValid)

	//Image data has been processd
	.post_frame_vsync		(post2_frame_vsync),		//Processed Image data vsync valid signal
	.post_frame_href		(post2_frame_href),		//Processed Image data href vaild  signal
	.post_frame_clken		(post2_frame_clken),		//Processed Image data output/capture enable clock
	.post_img_Bit			(post2_img_Bit)			//Processed Image Bit flag outout(1: Value, 0:inValid)
);

//--------------------------------------
//Bit Image Process with Dilation after Erosion Detector.
wire			post3_frame_vsync;	//Processed Image data vsync valid signal
wire			post3_frame_href;	//Processed Image data href vaild  signal
wire			post3_frame_clken;	//Processed Image data output/capture enable clock
wire			post3_img_Bit;		//Processed Image Bit flag outout(1: Value, 0:inValid)
VIP_Bit_Dilation_Detector
//#(
//	.IMG_HDISP	(IMG_HDISP),	//640*480
//	.IMG_VDISP	(IMG_VDISP)
//)
VIP_Bit_Erosion_Detector_inst
(
	//global clock
	.clk					(clk),  				//cmos video pixel clock
	.rst_n					(rst_n),				//global reset

	//Image data prepred to be processd
	.per_frame_vsync		(post2_frame_vsync),	//Prepared Image data vsync valid signal
	.per_frame_href			(post2_frame_href),		//Prepared Image data href vaild  signal
	.per_frame_clken		(post2_frame_clken),	//Prepared Image data output/capture enable clock
	.per_img_Bit			(post2_img_Bit),		//Processed Image Bit flag outout(1: Value, 0:inValid)

	//Image data has been processd
	.post_frame_vsync		(post3_frame_vsync),		//Processed Image data vsync valid signal
	.post_frame_href		(post3_frame_href),		//Processed Image data href vaild  signal
	.post_frame_clken		(post3_frame_clken),		//Processed Image data output/capture enable clock
	.post_img_Bit			(post3_img_Bit)			//Processed Image Bit flag outout(1: Value, 0:inValid)
);

//-------------------------------------------------------
//
wire			post4_frame_vsync;	//Processed Image data vsync valid signal
wire			post4_frame_href;	//Processed Image data href vaild  signal
wire			post4_frame_clken;	//Processed Image data output/capture enable clock
wire	[15:0]	post4_img;		//Processed Image Bit flag outout(1: Value, 0:inValid)

Face_Posion Face_Posion_inst(
    .clk                    (clk             ),
    .rst_n                  (rst_n           ),
    .per_frame_vsync        (post3_frame_vsync ),
    .per_frame_href         (post3_frame_href  ),
    .per_frame_clken        (post3_frame_clken ),
    .per_img_Bit            (post3_img_Bit     ),
    .post_frame_vsync       (post4_frame_vsync),
    .post_frame_href        (post4_frame_href ),
    .post_frame_clken       (post4_frame_clken),
    .x_min                  (x_min),
    .x_max                  (x_max),
    .y_min                  (y_min),
    .y_max                  (y_max),
    .lcd_x                  (lcd_x),
	.lcd_y                  (lcd_y),
    .post_img               (post4_img        )
    );

//-------------------------------------------------------
//assign  post_img = {16{post3_img_Bit}};    //Gray
assign  post_img = post4_img;
//Gray
/*
assign  post_frame_vsync    = post3_frame_vsync;
assign  post_frame_href     = post3_frame_href;
assign  post_frame_clken    = post3_frame_clken;
*/
assign  post_frame_vsync    = post4_frame_vsync;
assign  post_frame_href     = post4_frame_href;
assign  post_frame_clken    = post4_frame_clken;

endmodule

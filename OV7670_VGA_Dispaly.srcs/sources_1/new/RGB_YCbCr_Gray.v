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
	output		[7:0]	gray_data,
	output      [15:0]  points        
    );

//--------------------------------------------
//RGB565 to RGB 888 иж?????ии????????
wire 	[7:0]	cmos_R0;
wire 	[7:0]	cmos_G0;
wire 	[7:0]	cmos_B0;

assign cmos_R0	= 	cmos_R;
assign cmos_G0	= 	cmos_G;
assign cmos_B0	= 	cmos_B;


//--------------------------------------------
/*	Y 	=	(77 *R 	+ 	150*G 	+ 	29 *B)>>8
	Cb 	=	(-43*R	- 	85 *G	+ 	128*B)>>8 + 128
	Cr 	=	(128*R 	-	107*G  	-	21 *B)>>8 + 128
--->
	Y 	=	(77 *R 	+ 	150*G 	+ 	29 *B)>>8
	Cb 	=	(-43*R	- 	85 *G	+ 	128*B + 32768)>>8
	Cr 	=	(128*R 	-	107*G  	-	21 *B + 32768)>>8*/
//--------------------------------------------
//RGB888 to YCrCb
//step1 conmuse 1clk
reg 	[15:0]	cmos_R1, cmos_R2, cmos_R3;
reg 	[15:0]	cmos_G1, cmos_G2, cmos_G3;
reg 	[15:0]	cmos_B1, cmos_B2, cmos_B3;
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)begin
		cmos_R1 <= 16'd0;
        cmos_G1 <= 16'd0;
        cmos_B1 <= 16'd0;
		cmos_R2 <= 16'd0;
        cmos_G2 <= 16'd0;
        cmos_B2 <= 16'd0;
		cmos_R3 <= 16'd0;
        cmos_G3 <= 16'd0;
        cmos_B3 <= 16'd0;
	end
	else begin
		cmos_R1 <= cmos_R0 * 8'd77;
		cmos_G1 <= cmos_G0 * 8'd150;
		cmos_B1 <= cmos_B0 * 8'd29; 
		cmos_R2 <= cmos_R0 * 8'd43; 
		cmos_G2 <= cmos_G0 * 8'd85; 
		cmos_B2 <= cmos_B0 * 8'd128; 
        cmos_R3 <= cmos_R0 * 8'd128;
        cmos_G3 <= cmos_G0 * 8'd107;
        cmos_B3 <= cmos_B0 * 8'd21;
	end
end

//-----------------------------------------------
//step2 consume 1clk
reg		[15:0]	img_Y0;
reg 	[15:0]	img_Cb0;
reg 	[15:0]	img_Cr0;

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)begin
		img_Y0 <= 16'd0;
		img_Cb0 <= 16'd0;
		img_Cr0 <= 16'd0;
	end
	else begin
		img_Y0  <= cmos_R1 + cmos_G1 + cmos_B1;
		img_Cb0 <= cmos_B2 - cmos_R2 - cmos_G2 + 16'd32768;
		img_Cr0 <= cmos_R3 - cmos_G3 - cmos_B3 + 16'd32768;
	end
	
end
//-------------------------------------------
//step3 consume 1clk
reg	[7:0]	img_Y;
reg	[7:0]	img_Cb;
reg	[7:0]	img_Cr;
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)begin
		img_Y  <= 8'd0;
		img_Cb <= 8'd0;
		img_Cr <= 8'd0;
	end
	else begin
		img_Y  <= img_Y0  [15:8];
		img_Cb <= img_Cb0 [15:8];
		img_Cr <= img_Cr0 [15:8];
	end
	
end

//-----------------------------------------------
//binarization
//(82, 90, 240)
reg [7:0] img_Y2;
always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        img_Y2 <= 8'b0000_0000;
    else if(img_Cb > 77 && img_Cb < 127 &&img_Cr > 133 && img_Cr <173)
        img_Y2 <= 8'b1111_1111;
    else
        img_Y2 <= 8'b0000_0000;
    end

assign gray_data = img_Y2;

//-----------------------------------------------
//area counter
reg [15:0] area_cnt;
reg [15:0] y1_cnt_f;

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        area_cnt <= 16'b0000_0000_0000_0000;
    else if (per_vsync)
        area_cnt <= 16'b0000_0000_0000_0000;
    else if(   (img_Cb > 77 && img_Cb < 127 &&img_Cr > 133 && img_Cr <173) 
            && (lcd_x>=320 && lcd_x < 560 && lcd_y >= 180 && lcd_y < 420 ) )
        area_cnt <= area_cnt + 1;
    else
        area_cnt <= area_cnt;
    end
    
always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        y1_cnt_f <= 16'b0000_0000_0000_0000;
    else if (lcd_x == 580 && lcd_y == 425)
        y1_cnt_f <= area_cnt;
    else
        y1_cnt_f <= y1_cnt_f;
end
    
assign points = y1_cnt_f;	
    
//assign points = area_cnt;	  

//-----------------------------------------------
//y1 counter
//reg [15:0] y1_cnt;

//always @ (posedge clk or negedge rst_n) begin
//    if(!rst_n)
//        y1_cnt <= 16'b0000_0000_0000_0000;
//    else if (per_vsync)
//        y1_cnt <= 16'b0000_0000_0000_0000;
//    else if(   (img_Cb > 77 && img_Cb < 127 &&img_Cr > 133 && img_Cr <173) 
//            && (lcd_x>=320 && lcd_x < 560 && lcd_y >= 249 && lcd_y < 251 ) )
//        y1_cnt <= y1_cnt + 1;
//    else
//        y1_cnt <= y1_cnt;
//    end
    
//assign points = y1_cnt;	
//-------------------------------------------
//per_clken delay 3clk	
//reg 	[2:0]	per_clken_r;
//always @(posedge clk or negedge rst_n)begin
//	if(!rst_n)
//		per_clken_r <= 3'b0;
//	else
//		per_clken_r <= {per_clken_r[1:0], per_clken};
//end
reg 	[2:0]	per_clken_r;
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)
		per_clken_r <= 3'b0;
	else
		per_clken_r <= {per_clken_r[1:0], per_clken};
end

reg     [2:0]   per_vsync_r;
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)
		per_vsync_r <= 3'b0;
	else
		per_vsync_r <= {per_vsync_r[1:0], per_vsync};
end

assign	post_clken 	= 	per_clken_r[2];
assign  post_vsync  =   per_vsync_r[2];

//assign	gray_dout = {img_Y[7:3], img_Y[7:2], img_Y[7:3]};
//assign 	gray_data = {img_Y[7:5], img_Y[7:5], img_Y[7:6]};

//assign 	gray_data = img_Y;

endmodule

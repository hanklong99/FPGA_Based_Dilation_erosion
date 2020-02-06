`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/05/23 16:24:31
// Design Name: 
// Module Name: ov7725_top
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


module ov7670_top(
	input  				clk_125M,
	input 				rst_n,
	input  				OV7670_VSYNC,
	input  				OV7670_HREF,
	input  				OV7670_PCLK,
	output 				OV7670_XCLK,
	output 				OV7670_SIOC,
	inout  				OV7670_SIOD,
	input 		[7:0] 	OV7670_D,
    output 				OV7670_PWDN,
	output 				OV7670_RESET,
	
	output		     	LED,
//VGA_Display
	output		 	TMDS_Clk_p,
	output		 	TMDS_Clk_n,
	output		[2:0] 	TMDS_Data_p,
	output 		[2:0]	TMDS_Data_n
	
);

//frame_buffer
//modified
wire	[16:0] 	frame_addr;
wire 	[16:0] 	capture_addr;
//wire  capture_we;  
wire  			config_finished; 
//clock
wire  			clk_25M;     
wire  			resend;        
wire 	[15:0] 	frame_pixel;  
wire 	[15:0]  sensor_data;
//HDMI
wire de;
wire [4:0] vga_red;
wire [4:0] vga_blue;
wire [5:0] vga_green;
wire vga_hsync;
wire vga_vsync;
wire [15:0] points;

//Video Image processor module.
wire      [11:0]  x_min;
wire      [11:0]  x_max;
wire      [11:0]  y_min;
wire      [11:0]  y_max;

assign	OV7670_PWDN = 0;
assign 	OV7670_RESET = 1;

assign LED	 = 	~config_finished;
assign	OV7670_XCLK 	= 	clk_25M;



//--------------------------------
//debounce
debounce   btn_debounce(
	.clk			(clk_125M),
	.i				(1'b0),
	.o				(resend)
);
	
//--------------------------------
//clk_25M
clock clock_inst(
    .clk_out1		(clk_25M),
    .resetn			(rst_n),
    .clk_in1		(clk_125M));

//--------------------------------
//vga 
wire [9:0] lcd_x;
wire [9:0] lcd_y;
wire [11:0] x_min;
wire [11:0] x_max;
wire [11:0] y_min;
wire [11:0] y_max;

VGA_Dispay u_VGA_Dispay (
    .clk			(clk_25M), 
    .rst_n			(rst_n), 
    .lcd_data		({vga_red, vga_green, vga_blue}), 
    .vga_hsync		(vga_hsync), 
    .vga_vsync		(vga_vsync), 
    .frame_addr		(frame_addr), 
	.frame_pixel	(frame_pixel),
	.de (de),
	.lcd_x (lcd_x),
	.lcd_y (lcd_y),
//	.x_min(x_min),
//    .x_max(x_max),
//    .y_min(y_min),
//    .y_max(y_max),
	.points (points)//input cntr variable
    );

//-----------------------------------------------------------------------
//frame_buffer
frame_buffer frame_buffer_inst (
	.clka			(OV7670_PCLK),    	// input wire clka
	.wea			(1'b1),      		// input wire [0 : 0] wea
	.addra			(capture_addr),  	// input wire [16 : 0] addra
	.dina			(sensor_data),    		// input wire [15 : 0] dina
	.clkb			(clk_25M),    		// input wire clkb
	.addrb			(frame_addr),  		// input wire [16 : 0] addrb
	.doutb			(frame_pixel)  		// output wire [15 : 0] doutb
);

//--------------------------------
//ov7670_capture
 ov7670_capture capture(
    .lcd_x (lcd_x),
    .lcd_y (lcd_y),
 	.pclk			(OV7670_PCLK),
 	.vsync 			(OV7670_VSYNC),
 	.href  			(OV7670_HREF),
 	.d     			(OV7670_D),
 	.rst_n          (rst_n),
 	.addr  			(capture_addr),
 	.post_dout			(sensor_data),
 	
	.x_min(x_min),
    .x_max(x_max),
    .y_min(y_min),
    .y_max(y_max),
 	.points          (points)
 	//.post_clken   			()
 	);

//--------------------------------
//I2C_AV_Config
I2C_AV_Config IIC(
 	.iCLK   		(clk_25M),    
 	.iRST_N 		(!resend),    
 	.Config_Done 	(config_finished),
 	.I2C_SDAT  		(OV7670_SIOD),    
 	.I2C_SCLK  		(OV7670_SIOC),
 	.LUT_INDEX 		(),
 	.I2C_RDATA 		()
 	);

rgb2dvi_0 rgb_to_hdmi (
  .TMDS_Clk_p(TMDS_Clk_p),    // output wire TMDS_Clk_p
  .TMDS_Clk_n(TMDS_Clk_n),    // output wire TMDS_Clk_n
  .TMDS_Data_p(TMDS_Data_p),  // output wire [2 : 0] TMDS_Data_p
  .TMDS_Data_n(TMDS_Data_n),  // output wire [2 : 0] TMDS_Data_n
  .aRst_n(1'b1),            // input wire aRst_n
  .vid_pData({vga_red[4:0],vga_red[4:2],vga_blue[4:0],vga_blue[4:2],vga_green[5:0],vga_green[5:4]}),      //RBG input wire [23 : 0] vid_pData
  .vid_pVDE(de),        // input wire vid_pVDE
  .vid_pHSync(vga_hsync),    // input wire vid_pHSync
  .vid_pVSync(vga_vsync),    // input wire vid_pVSync
  .PixelClk(clk_25M),        // input wire PixelClk
  .SerialClk(clk_125M)      // input wire SerialClk
);
	 
endmodule

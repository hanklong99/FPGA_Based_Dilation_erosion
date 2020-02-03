`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/05/23 15:48:40
// Design Name: 
// Module Name: VGA_Dispay
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
	`define	H_FRONT	11'd16
	`define	H_SYNC 	11'd96  
	`define	H_TOTAL	11'd800 	
						
	`define	V_FRONT	11'd10  
	`define	V_SYNC 	11'd2     
	`define	V_TOTAL	11'd525

module VGA_Dispay(
	input 					clk,
	input 					rst_n,
	input      [15:0]       points,
	input       [11:0]      x_min,
    input       [11:0]      x_max,
    input       [11:0]      y_min,
    input       [11:0]      y_max,
	
	output		[15:0]		lcd_data,
	output 	reg 			vga_hsync,
	output 	reg 			vga_vsync,

	output 		[16:0] 		frame_addr,
	input 		[15:0] 		frame_pixel,
	output de,
	output [9:0] lcd_x,
	output [9:0] lcd_y
    );

`define SILVER  16'd50712//Òø»Ò	
`define	 YELLOW 	16'b11111_111111_00000
	
//Timing constants
parameter 	hRez   		= 640;
parameter 	hStartSync 	= 640+16;
parameter 	hEndSync   	= 640+16+96;
parameter 	hMaxCount  	= 800;
	
parameter 	vRez       	= 480;
parameter 	vStartSync 	= 480+10;
parameter 	vEndSync   	= 480+10+2;
parameter 	vMaxCount	= 480+10+2+33;

parameter 	hsync_active	=0;
parameter 	vsync_active  	=0;


reg	[9:0] 	hCounter;
reg	[9:0] 	vCounter;   

assign lcd_x = hCounter;
assign lcd_y = vCounter;
reg	[16:0] 	address;  
reg 				blank;
   
   
assign	frame_addr = address;
assign 	HCnt = hCounter;
assign 	VCnt = vCounter;

//------------------------------------------------------------
//frame_en
reg 	frame_en;
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
		frame_en <= 1'b0;
	else if(lcd_y == y_min + 180 && lcd_x >= x_min + 280 && lcd_x <= x_max + 280
		|| lcd_y == y_max + 180 && lcd_x >= x_min + 280 && lcd_x <= x_max + 280
		|| lcd_x == x_min + 280 && lcd_y >= y_min + 180 && lcd_y <= y_max + 180
		|| lcd_x == x_max + 280 && lcd_y >= y_min + 180 && lcd_y <= y_max + 180)
		frame_en <= 1'b1;
	else 
		frame_en <= 1'b0;
		
//-------------------------------------------
//area
//if  (points < 10000 && hCounter >= 580 && vCounter >= 425)
//	if(!rst_n)
//		frame_en <= 1'b0;
//	else if(hCounter >= 600 && hCounter < 604 && vCounter >= 430 && vCounter < 434)
//		frame_en <= 1'b1;
//	else 
//		frame_en <= 1'b0;
//else if (points < 20000 && points >= 10000 && hCounter >= 580 && vCounter >= 425)
//	if(!rst_n)
//		frame_en <= 1'b0;
//	else if(hCounter >= 600 && hCounter < 604 && vCounter >= 430 && vCounter < 434//×ó±ß¿ò
//		|| hCounter >= 600 && hCounter < 604 && vCounter >= 436 && vCounter < 440)
//		frame_en <= 1'b1;
//	else 
//		frame_en <= 1'b0;
//else if (points <= 30000 && points >= 20000 && hCounter >= 580 && vCounter >= 425)
//	if(!rst_n)
//		frame_en <= 1'b0;
//	else if(hCounter >= 600 && hCounter < 604 && vCounter >= 430 && vCounter < 434//×ó±ß¿ò
//		|| hCounter >= 600 && hCounter < 604 && vCounter >= 436 && vCounter < 440
//		|| hCounter >= 600 && hCounter < 604 && vCounter >= 442 && vCounter < 446)
//		frame_en <= 1'b1;
//	else 
//		frame_en <= 1'b0;
//else if (points <= 40000 && points >= 30000 && hCounter >= 580 && vCounter >= 425)
//	if(!rst_n)
//		frame_en <= 1'b0;
//	else if(hCounter >= 600 && hCounter < 604 && vCounter >= 430 && vCounter < 434//×ó±ß¿ò
//		|| hCounter >= 600 && hCounter < 604 && vCounter >= 436 && vCounter < 440
//		|| hCounter >= 600 && hCounter < 604 && vCounter >= 442 && vCounter < 446
//		|| hCounter >= 600 && hCounter < 604 && vCounter >= 448 && vCounter < 452)
//		frame_en <= 1'b1;
//	else 
//		frame_en <= 1'b0;
//else if (points <= 50000 && points >= 40000 && hCounter >= 580 && vCounter >= 425)
//	if(!rst_n)
//		frame_en <= 1'b0;
//	else if(hCounter >= 600 && hCounter < 604 && vCounter >= 430 && vCounter < 434//×ó±ß¿ò
//		|| hCounter >= 600 && hCounter < 604 && vCounter >= 436 && vCounter < 440
//		|| hCounter >= 600 && hCounter < 604 && vCounter >= 442 && vCounter < 446
//		|| hCounter >= 600 && hCounter < 604 && vCounter >= 448 && vCounter < 452
//		|| hCounter >= 600 && hCounter < 604 && vCounter >= 454 && vCounter < 458)
//		frame_en <= 1'b1;
//	else 
//		frame_en <= 1'b0;
//-------------------------------------------
//y1
if  (points == 0 && hCounter >= 580 && vCounter >= 425)
	if(!rst_n)
		frame_en <= 1'b0;
	else if(hCounter >= 600 && hCounter < 604 && vCounter >= 430 && vCounter < 434)
		frame_en <= 1'b1;
	else 
		frame_en <= 1'b0;
else if (points < 120 && points >= 60 && hCounter >= 580 && vCounter >= 425)
	if(!rst_n)
		frame_en <= 1'b0;
	else if(hCounter >= 600 && hCounter < 604 && vCounter >= 430 && vCounter < 434//×ó±ß¿ò
		|| hCounter >= 600 && hCounter < 604 && vCounter >= 436 && vCounter < 440)
		frame_en <= 1'b1;
	else 
		frame_en <= 1'b0;
else if (points <= 180 && points >= 120 && hCounter >= 580 && vCounter >= 425)
	if(!rst_n)
		frame_en <= 1'b0;
	else if(hCounter >= 600 && hCounter < 604 && vCounter >= 430 && vCounter < 434//×ó±ß¿ò
		|| hCounter >= 600 && hCounter < 604 && vCounter >= 436 && vCounter < 440
		|| hCounter >= 600 && hCounter < 604 && vCounter >= 442 && vCounter < 446)
		frame_en <= 1'b1;
	else 
		frame_en <= 1'b0;
else if (points <= 240 && points >= 180 && hCounter >= 580 && vCounter >= 425)
	if(!rst_n)
		frame_en <= 1'b0;
	else if(hCounter >= 600 && hCounter < 604 && vCounter >= 430 && vCounter < 434//×ó±ß¿ò
		|| hCounter >= 600 && hCounter < 604 && vCounter >= 436 && vCounter < 440
		|| hCounter >= 600 && hCounter < 604 && vCounter >= 442 && vCounter < 446
		|| hCounter >= 600 && hCounter < 604 && vCounter >= 448 && vCounter < 452)
		frame_en <= 1'b1;
	else 
		frame_en <= 1'b0;
else// if (points <= 300 && points >= 240 && hCounter >= 580 && vCounter >= 425)
	if(!rst_n)
		frame_en <= 1'b0;
	else if(hCounter >= 600 && hCounter < 604 && vCounter >= 430 && vCounter < 434//×ó±ß¿ò
		|| hCounter >= 600 && hCounter < 604 && vCounter >= 436 && vCounter < 440
		|| hCounter >= 600 && hCounter < 604 && vCounter >= 442 && vCounter < 446
		|| hCounter >= 600 && hCounter < 604 && vCounter >= 448 && vCounter < 452
		|| hCounter >= 600 && hCounter < 604 && vCounter >= 454 && vCounter < 458)
		frame_en <= 1'b1;
	else 
		frame_en <= 1'b0;
end

assign 	lcd_data = (frame_en == 1'b1)? `YELLOW: lcd_data_r0;//ÓÐ°×¿ò
//assign 	lcd_data = (frame_en == 1'b1)? lcd_data_r0: lcd_data_r0;//ÎÞ°×¿ò

//-----------------------------------------------------------
// represent the cntr number of points
//reg frame_en;
//always@(posedge clk or negedge rst_n)begin
//if  (points < 10000)
//	if(!rst_n)
//		frame_en <= 1'b0;
//	else if(hCounter >= 600 && hCounter < 604 && vCounter >= 430 && vCounter < 434)
//		frame_en <= 1'b1;
//	else 
//		frame_en <= 1'b0;
//else if (points < 20000 && points >= 10000)
//	if(!rst_n)
//		frame_en <= 1'b0;
//	else if(hCounter >= 600 && hCounter < 604 && vCounter >= 430 && vCounter < 434//×ó±ß¿ò
//		|| hCounter >= 600 && hCounter < 604 && vCounter >= 436 && vCounter < 440)
//		frame_en <= 1'b1;
//	else 
//		frame_en <= 1'b0;
//else if (points <= 30000 && points >= 20000)
//	if(!rst_n)
//		frame_en <= 1'b0;
//	else if(hCounter >= 600 && hCounter < 604 && vCounter >= 430 && vCounter < 434//×ó±ß¿ò
//		|| hCounter >= 600 && hCounter < 604 && vCounter >= 436 && vCounter < 440
//		|| hCounter >= 600 && hCounter < 604 && vCounter >= 442 && vCounter < 446)
//		frame_en <= 1'b1;
//	else 
//		frame_en <= 1'b0;
//else if (points <= 40000 && points >= 30000)
//	if(!rst_n)
//		frame_en <= 1'b0;
//	else if(hCounter >= 600 && hCounter < 604 && vCounter >= 430 && vCounter < 434//×ó±ß¿ò
//		|| hCounter >= 600 && hCounter < 604 && vCounter >= 436 && vCounter < 440
//		|| hCounter >= 600 && hCounter < 604 && vCounter >= 442 && vCounter < 446
//		|| hCounter >= 600 && hCounter < 604 && vCounter >= 448 && vCounter < 452)
//		frame_en <= 1'b1;
//	else 
//		frame_en <= 1'b0;
//else if (points <= 50000 && points >= 40000)
//	if(!rst_n)
//		frame_en <= 1'b0;
//	else if(hCounter >= 600 && hCounter < 604 && vCounter >= 430 && vCounter < 434//×ó±ß¿ò
//		|| hCounter >= 600 && hCounter < 604 && vCounter >= 436 && vCounter < 440
//		|| hCounter >= 600 && hCounter < 604 && vCounter >= 442 && vCounter < 446
//		|| hCounter >= 600 && hCounter < 604 && vCounter >= 448 && vCounter < 452
//		|| hCounter >= 600 && hCounter < 604 && vCounter >= 454 && vCounter < 458)
//		frame_en <= 1'b1;
//	else 
//		frame_en <= 1'b0;
//end
//assign 	lcd_data = (frame_en == 1'b1)? `SILVER: lcd_data_r0;//ÓÐ°×¿ò
//-----------------------------------------------------------
//
reg 	[15:0]	lcd_data_r0;
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		hCounter	<= 10'b0;
	    vCounter 	<= 10'b0;
	    address 	<= 17'b0; 
	    blank 		<= 1'b1;    
	end
	else begin
        if(hCounter == hMaxCount - 1)begin
			hCounter <=  10'b0;
			if (vCounter == vMaxCount - 1)
				vCounter <=  10'b0;
			else
				vCounter <= vCounter + 1;
			end
		else
			hCounter <= hCounter + 1;
		if (blank ==0) begin
			/* vga_red   <= frame_pixel[15:11];
			vga_green <= frame_pixel[10:5];
			vga_blue  <= frame_pixel[4:0]; */
			lcd_data_r0 <= frame_pixel;
			end
		else begin
			/* vga_red   <= 5'b0;
			vga_green <= 6'b0;
			vga_blue  <= 5'b0; */
			lcd_data_r0 <= 'd0;
		     end;
		if(vCounter  >= 420 || vCounter  < 180) begin
			address <= 17'b0; 
			blank <= 1;
			end
		else begin
			if (hCounter  < 600 && hCounter  >= 280) begin
				blank <= 0;
				address <= address+1;
				end
			else
				blank <= 1;
		end
		// Are we in the hSync pulse? (one has been added to include frame_buffer_latency)
		if(hCounter > hStartSync && hCounter <= hEndSync)
			vga_hsync <= hsync_active;
		else
			vga_hsync <= ~ hsync_active;
		// Are we in the vSync pulse?
		if(vCounter >= vStartSync && vCounter < vEndSync )
			vga_vsync <= vsync_active;
		else
			vga_vsync <= ~ vsync_active;
	end
end

wire hs = (hCounter > `H_FRONT + `H_SYNC - 1 && hCounter <= `H_TOTAL  - 1)? 1'b1: 1'b0; 
wire vs = (vCounter > `V_FRONT + `V_SYNC - 1 && vCounter <=  `V_TOTAL - 1)? 1'b1: 1'b0;
assign de = hs & vs;  
endmodule

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
//	input       [11:0]      x_min,
//    input       [11:0]      x_max,
//    input       [11:0]      y_min,
//    input       [11:0]      y_max,
	
	output	reg	[15:0]		lcd_data,
	output 	reg 			vga_hsync,
	output 	reg 			vga_vsync,
    input                   sw1,
    
	output 		[16:0] 		frame_addr,
	input 		[15:0] 		frame_pixel,
	output de,
	output [9:0] lcd_x,
	output [9:0] lcd_y
    );

`define SILVER  16'd50712//Òø»Ò	
`define	 YELLOW 	16'b11111_111111_00000
`define	 RED 	16'b11111_000000_00000
`define	 GREEN 	16'b00000_111111_00000
`define	 BLUE 	16'b00000_000000_11111

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

reg [11:0] x_sum;
reg [11:0] y_sum;
reg [11:0] x_center;
reg [11:0] y_center;

wire [11:0] x_min;
wire [11:0] x_max;
wire [11:0] y_min;
wire [11:0] y_max;
   
assign	frame_addr = address;
assign 	HCnt = hCounter;
assign 	VCnt = vCounter;

//-----------------------------------------------------------
//center calculation
always @ (posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        x_sum <= 0;
        y_sum <= 0;
    end
    else begin
        x_sum <= x_min + x_max;
        y_sum <= y_min + y_max;
    end
end

always @ (posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        x_center <= 0;
        y_center <= 0;
    end
    else begin
        x_center <= x_sum[11:1];
        y_center <= y_sum[11:1];
    end
end

//------------------------------------------------------------
//frame_en
reg 	[2:0] frame_en;

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
		frame_en <= 3'b000;
//	else if(lcd_y == y_min + 40 && lcd_x >= x_min + 120 && lcd_x <= x_max+120
//		|| lcd_y == y_max + 40 && lcd_x >= x_min + 120 && lcd_x <= x_max+120
//		|| lcd_x == x_min+120 && lcd_y >= y_min + 40 && lcd_y <= y_max + 40
//		|| lcd_x == x_max+120 && lcd_y >= y_min + 40 && lcd_y <= y_max + 40)
	else if(lcd_y == y_min && lcd_x >= x_min && lcd_x <= x_max
		|| lcd_y == y_max && lcd_x >= x_min && lcd_x <= x_max
		|| lcd_x == x_min && lcd_y >= y_min && lcd_y <= y_max
		|| lcd_x == x_max && lcd_y >= y_min && lcd_y <= y_max
		|| lcd_x == x_center && lcd_y >= y_min && lcd_y <= y_max
		|| lcd_y == y_center && lcd_x >= x_min && lcd_x <= x_max)
		
		frame_en <= 3'b001;
//    else if(   (lcd_x == x_center && lcd_y >= y_min && lcd_y <= y_max)
//            || (lcd_y == y_center && lcd_x >= x_min && lcd_x <= x_max) )
//         frame_en <= 3'b001;
	else if ( lcd_y >= 280  && lcd_y <= 510  && lcd_x >= 120 && lcd_x <= 440)
		frame_en <= 3'b010;
		
    else if(lcd_y >= 280 && lcd_y <= 510 && lcd_x >= 440 && lcd_x <= 780 )
		frame_en <= 3'b011;
	
	else 
//	if(lcd_y == 40 && lcd_x >= 440 && lcd_x <= 780
//		|| lcd_y == 280 && lcd_x >= 440 && lcd_x <= 780
//		|| lcd_x == 440 && lcd_y >= 40 && lcd_y <= 280
//		|| lcd_x == 780 && lcd_y >= 40 && lcd_y <= 280)
    if(lcd_y >= 40 && lcd_y <= 280 && lcd_x >= 440 && lcd_x <= 780)
		frame_en <= 3'b100;
		
	else 
		frame_en <= 3'b000;
end

//------------------------------------------------------------
//block_en
wire [15:0]	lcd_block;
wire flag;

application u_application(
    .clk(clk),
    .rst_n(rst_n),
    .x_center(x_center),
    .y_center(y_center),
    .lcd_x(lcd_x),
    .lcd_y(lcd_y),

    .sw1(sw1),
    .lcd_block(lcd_block),
    .flag(flag)
    );

//reg 	[2:0] block_en;
//reg [9:0] y_g;
//reg [9:0] x_g;
//reg [31:0] cnt;
//reg       cnt_clk;
//reg 	[15:0]	lcd_block;

//always@(posedge clk or negedge rst_n)begin
//	if(!rst_n) begin
//		block_en <= 3'b000;
//		x_g <= 600;
//		y_g <= 70;
//		cnt <= 0;
//		lcd_block <= 0;
//	end
//	else begin
//	if(lcd_y >= y_g - 5 && lcd_y <= y_g + 5 && lcd_x >= x_g - 5 && lcd_x <= x_g + 5)begin
//	   lcd_block <= `GREEN;
//	end
//	else 
//	   lcd_block <= 0;
	   
//    cnt <= cnt + 1;
//	if(y_g >= 240) begin
//	   y_g <= 70;
//	   cnt <= 0;
//	end
//	else if(cnt == 25000000) begin
//	   y_g <= y_g + 10;
//	   cnt <= 0;
//	end
//	end
//end

//-------------------------------------------------
//track 
wire [15:0]	lcd_track;
track u_track(
    .clk(clk),
    .rst_n(rst_n),
    .x_center(x_center),
    .y_center(y_center),
    .lcd_x(lcd_x),
    .lcd_y(lcd_y),

    .sw1(sw1),
    .lcd_track(lcd_track)
    );

wire [15:0] lcd_scoreboard;
scoreboard u_scoreboard(
    .clk (clk),
    .rst_n(rst_n),
    .flag (flag),
    .lcd_x (lcd_x),
    .lcd_y (lcd_y),

    .sw1 ( ),
    .lcd_scoreboard (lcd_scoreboard)
    );


//------------------------------------------------------------------------
//display
reg 	[15:0]	lcd_data_r0;
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
		lcd_data <= 16'b0;
	else if (frame_en == 3'b000)
	   lcd_data <= lcd_data_r0;
	else if (frame_en == 3'b001) 
	   lcd_data <= `YELLOW;
	else if (frame_en == 3'b010)
	   lcd_data <= lcd_track;
	else if (frame_en == 3'b011)
	   lcd_data <= lcd_scoreboard;
	else if (frame_en == 3'b100)
	   lcd_data <= lcd_block;
end

//case (frame_en)
//    3'b000: lcd_data <= lcd_data_r0;
//    3'b001: lcd_data <= `YELLOW;
//    3'b010: lcd_data <= `RED;
//    3'b011: lcd_data <= `GREEN;
//    3'b100: lcd_data <= `BLUE;
//endcase
    

//assign 	lcd_data = (frame_en == 1'b1)? `YELLOW: lcd_data_r0;//ÓÐ°×¿ò
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
		if(vCounter  >= 280 || vCounter  < 40) begin
			address <= 17'b0; 
			blank <= 1;
			end
		else begin
			if (hCounter  < 440 && hCounter  >= 120) begin
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

//-----------------------------------------------------
//rectangle
position position_inst(
    .clk                    (clk             ),
    .rst_n                  (rst_n           ),
//    .per_frame_vsync        (post_vsync_Median ),
//    .per_frame_href         (),
//    .per_frame_clken        (post_clken_Median ),
//    .per_img_Bit            (post_data_Median     ),

    .per_frame_vsync        ( ),
    .per_frame_href         (),
    .per_frame_clken        ( ),
    .per_img_Bit            (frame_pixel[7:0]),
    
//    .per_frame_vsync        (post_vsync_erosion ),
//    .per_frame_href         (),
//    .per_frame_clken        (post_clken_erosion ),
//    .per_img_Bit            (post_data_erosion ),
    
    .post_frame_vsync       ( ),
    .post_frame_href        (),
    .post_frame_clken       ( ),
    .x_min_f                  (x_min),
    .x_max_f                  (x_max),
    .y_min_f                  (y_min),
    .y_max_f                  (y_max),
    .lcd_x                  (lcd_x),
	.lcd_y                  (lcd_y),
	.post_img ( )
    );




endmodule

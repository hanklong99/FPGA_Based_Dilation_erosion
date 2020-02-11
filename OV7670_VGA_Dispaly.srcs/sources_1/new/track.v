`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/06 22:57:20
// Design Name: 
// Module Name: track
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


module track(
    input clk,
    input rst_n,
    input [11:0] x_center,
    input [11:0] y_center,
    input  [9:0] lcd_x,
    input  [9:0] lcd_y,

    input sw0,
    input sw1,
    input sw2,
    output reg [15:0]	lcd_track
    );
    
reg 	[2:0] track_en;
reg [9:0] y_g;
reg [9:0] x_g;
reg [9:0] x_loc;
reg [9:0] y_loc;
reg [9:0] x_loc_n;
reg [9:0] y_loc_n;

reg [9:0] disx_e;
reg [9:0] disy_e;

reg [9:0] disx_i;
reg [9:0] disy_i;

reg [9:0] disx_o;
reg [9:0] disy_o;

reg [9:0] disx_u;
reg [9:0] disy_u;

reg [9:0] disx_p;
reg [9:0] disy_p;

reg [9:0] disx_l;
reg [9:0] disy_l;

reg [9:0] disx_c;
reg [9:0] disy_c;

reg [9:0] disx_t;
reg [9:0] disy_t;

reg [9:0] disx_n;
reg [9:0] disy_n;

reg [9:0] disx_s;
reg [9:0] disy_s;

//reg [9:0] disx_c;
//reg [9:0] disy_c;

reg [9:0] disx_r;
reg [9:0] disy_r;

reg [9:0] disx_b;
reg [9:0] disy_b;

reg [9:0] disx_d;
reg [9:0] disy_d;

reg [9:0] disx_1;
reg [9:0] disy_1;

reg [9:0] disx_2;
reg [9:0] disy_2;

reg [9:0] disx_3;
reg [9:0] disy_3;

reg [9:0] disx_4;
reg [9:0] disy_4;

reg [9:0] disx_5;
reg [9:0] disy_5;

reg [9:0] disx_6;
reg [9:0] disy_6;

reg [9:0] disx_7;
reg [9:0] disy_7;

reg [9:0] disx_8;
reg [9:0] disy_8;

reg [9:0] disx_9;
reg [9:0] disy_9;

reg [9:0] disx_0;
reg [9:0] disy_0;
always@(posedge clk or negedge rst_n)begin
	if(!rst_n) begin
	   lcd_track <= 0;
	end
	else begin
	   x_loc <= 150;
	   y_loc <= 300;
	   
	   x_loc_n <= 150;
	   y_loc_n <= 350;
	   
	   // letters
	   disx_e <= 18;
	   disy_e <= 0;
	   
	   disx_i <= 36;
	   disy_i <= 0;
	   
	   disx_o <= 54;
	   disy_o <= 0;
	   
	   disx_u <= 72;
	   disy_u <= 0;
	   
	   disx_p <= 90;
	   disy_p <= 0;
	   
	   disx_l <= 108;
	   disy_l <= 0;
	   
	   disx_c <= 126;
	   disy_c <= 0;
	   
	   disx_t <= 144;
	   disy_t <= 0;
	   
	   disx_n <= 162;
	   disy_n <= 0;
	   
	   disx_s <= 180;
	   disy_s <= 0;
	   
	   disx_r <= 198;
	   disy_r <= 0;
	   
	   disx_b <= 216;
	   disy_b <= 0;
	   
	   disx_d <= 234;
	   disy_d <= 0;
	   
	   // numbers
	   disx_0 <= 0;
	   disy_0 <= 0;
	   
	   disx_1 <= 18;
	   disy_1 <= 0;
	   
	   disx_2 <= 36;
	   disy_2 <= 0;
	   
	   disx_3 <= 54;
	   disy_3 <= 0;
	   
	   disx_4 <= 72;
	   disy_4 <= 0;
	   
	   disx_5 <= 90;
	   disy_5 <= 0;
	   
	   disx_6 <= 108;
	   disy_6 <= 0;
	   
	   disx_7 <= 126;
	   disy_7 <= 0;
	   
	   disx_8 <= 144;
	   disy_8 <= 0;
	   
	   disx_9 <= 162;
	   disy_9 <= 0;
	   
	   
	   // A
	   if( (lcd_x >= 3 + x_loc && lcd_x <= 12 + x_loc && lcd_y >= 0 + y_loc && lcd_y <= 3 + y_loc ) 
	       || (lcd_x >= 0 + x_loc && lcd_x <= 3 + x_loc && lcd_y >= 3 + y_loc && lcd_y <= 21 + y_loc )
	       || (lcd_x >= 12 + x_loc && lcd_x <= 15 + x_loc && lcd_y >= 3 + y_loc && lcd_y <= 21 + y_loc )
	       || (lcd_x >= 0 + x_loc && lcd_x <= 15 + x_loc && lcd_y >= 9 + y_loc && lcd_y <= 12 + y_loc ) )begin
	       lcd_track <= `RED;
	   end
	  // E
	   else if( (lcd_x >= 0 + x_loc + disx_e && lcd_x <= 15 + x_loc + disx_e && lcd_y >= 0 + y_loc + disy_e && lcd_y <= 3 + y_loc + disy_e ) 
	       || (lcd_x >= 0 + x_loc + disx_e && lcd_x <= 3 + x_loc + disx_e && lcd_y >= 0 + y_loc + disy_e && lcd_y <= 21 + y_loc + disy_e )
	       || (lcd_x >= 0 + x_loc + disx_e && lcd_x <= 12 + x_loc + disx_e && lcd_y >= 9 + y_loc + disy_e && lcd_y <= 12 + y_loc + disy_e  )
	       || (lcd_x >= 0 + x_loc + disx_e && lcd_x <= 15 + x_loc + disx_e && lcd_y >= 18 + y_loc + disy_e && lcd_y <= 21 + y_loc + disy_e ) )begin
	       lcd_track <= `RED;
	   end
	   // I
	   else if( (lcd_x >= 3 + x_loc + disx_i && lcd_x <= 12 + x_loc + disx_i && lcd_y >= 0 + y_loc + disy_i && lcd_y <= 3 + y_loc + disy_i ) 
	       || (lcd_x >= 6 + x_loc + disx_i && lcd_x <= 9 + x_loc + disx_i && lcd_y >= 0 + y_loc + disy_i && lcd_y <= 21 + y_loc + disy_i )
	       || (lcd_x >= 3 + x_loc + disx_i && lcd_x <= 12 + x_loc + disx_i && lcd_y >= 18 + y_loc + disy_i && lcd_y <= 21 + y_loc + disy_i  ) )begin
	       lcd_track <= `RED;
	   end
	   // O
	   else if( (lcd_x >= 3 + x_loc + disx_o && lcd_x <= 12 + x_loc + disx_o && lcd_y >= 0 + y_loc + disy_o && lcd_y <= 3 + y_loc + disy_o ) 
	       || (lcd_x >= 0 + x_loc + disx_o && lcd_x <= 3 + x_loc + disx_o && lcd_y >= 3 + y_loc + disy_o && lcd_y <= 18 + y_loc + disy_o )
	       || (lcd_x >= 12 + x_loc + disx_o && lcd_x <= 15 + x_loc + disx_o && lcd_y >= 3 + y_loc + disy_o && lcd_y <= 18 + y_loc + disy_o  )
	       || (lcd_x >= 3 + x_loc + disx_o && lcd_x <= 12 + x_loc + disx_o && lcd_y >= 18 + y_loc + disy_o && lcd_y <= 21 + y_loc + disy_o ) )begin
	       lcd_track <= `RED;
	   end
	   // U
	   else if( (lcd_x >= 0 + x_loc + disx_u && lcd_x <= 3 + x_loc + disx_u && lcd_y >= 0 + y_loc + disy_u && lcd_y <= 18 + y_loc + disy_u )
	       || (lcd_x >= 12 + x_loc + disx_u && lcd_x <= 15 + x_loc + disx_u && lcd_y >= 0 + y_loc + disy_u && lcd_y <= 18 + y_loc + disy_u  )
	       || (lcd_x >= 3 + x_loc + disx_u && lcd_x <= 12 + x_loc + disx_u && lcd_y >= 18 + y_loc + disy_u && lcd_y <= 21 + y_loc + disy_u ) )begin
	       lcd_track <= `RED;
	   end
	   
	   // P
	   else if( (lcd_x >= 0 + x_loc + disx_p && lcd_x <= 12 + x_loc + disx_p && lcd_y >= 0 + y_loc + disy_p && lcd_y <= 3 + y_loc + disy_p ) 
	       || (lcd_x >= 0 + x_loc + disx_p && lcd_x <= 3 + x_loc + disx_p && lcd_y >= 0 + y_loc + disy_p && lcd_y <= 21 + y_loc + disy_p )
	       || (lcd_x >= 12 + x_loc + disx_p && lcd_x <= 15 + x_loc + disx_p && lcd_y >= 3 + y_loc + disy_p && lcd_y <= 9 + y_loc + disy_p  )
	       || (lcd_x >= 0 + x_loc + disx_p && lcd_x <= 12 + x_loc + disx_p && lcd_y >= 9 + y_loc + disy_p && lcd_y <= 12 + y_loc + disy_p ) )begin
	       lcd_track <= `RED;
	   end
	   
	   // L
	   else if( (lcd_x >= 0 + x_loc + disx_l && lcd_x <= 3 + x_loc + disx_l && lcd_y >= 0 + y_loc + disy_l && lcd_y <= 21 + y_loc + disy_l ) 
	       || (lcd_x >= 0 + x_loc + disx_l && lcd_x <= 15 + x_loc + disx_l && lcd_y >= 18 + y_loc + disy_l && lcd_y <= 21 + y_loc + disy_l ) )begin
	       lcd_track <= `RED;
	   end
	   
	   // C
	   else if( (lcd_x >= 3 + x_loc + disx_c && lcd_x <= 12 + x_loc + disx_c && lcd_y >= 0 + y_loc + disy_c && lcd_y <= 3 + y_loc + disy_c ) 
	       || (lcd_x >= 0 + x_loc + disx_c && lcd_x <= 3 + x_loc + disx_c && lcd_y >= 3 + y_loc + disy_c && lcd_y <= 18 + y_loc + disy_c )
	       || (lcd_x >= 3 + x_loc + disx_c && lcd_x <= 12 + x_loc + disx_c && lcd_y >= 18 + y_loc + disy_c && lcd_y <= 21 + y_loc + disy_c  )
	       || (lcd_x >= 12 + x_loc + disx_c && lcd_x <= 15 + x_loc + disx_c && lcd_y >= 3 + y_loc + disy_c && lcd_y <= 6 + y_loc + disy_c  )
	       || (lcd_x >= 12 + x_loc + disx_c && lcd_x <= 15 + x_loc + disx_c && lcd_y >= 15 + y_loc + disy_c && lcd_y <= 18 + y_loc + disy_c ) )begin
	       lcd_track <= `RED;
	   end
	   
	   // T
	   else if( (lcd_x >= 0 + x_loc + disx_t && lcd_x <= 15 + x_loc + disx_t && lcd_y >= 0 + y_loc + disy_t && lcd_y <= 3 + y_loc + disy_t ) 
	       || (lcd_x >= 6 + x_loc + disx_t && lcd_x <= 9 + x_loc + disx_t && lcd_y >= 0 + y_loc + disy_t && lcd_y <= 21 + y_loc + disy_t ) )begin
	       lcd_track <= `RED;
	   end
	   
	   // N
	   else if( (lcd_x >= 0 + x_loc + disx_n && lcd_x <= 3 + x_loc + disx_n && lcd_y >= 0 + y_loc + disy_n && lcd_y <= 21 + y_loc + disy_n ) 
	       || (lcd_x >= 12 + x_loc + disx_n && lcd_x <= 15 + x_loc + disx_n && lcd_y >= 0 + y_loc + disy_n && lcd_y <= 21 + y_loc + disy_n )
	       || (lcd_x >= 3 + x_loc + disx_n && lcd_x <= 6 + x_loc + disx_n && lcd_y >= 6 + y_loc + disy_n && lcd_y <= 9 + y_loc + disy_n  )
	       || (lcd_x >= 6 + x_loc + disx_n && lcd_x <= 9 + x_loc + disx_n && lcd_y >= 9 + y_loc + disy_n && lcd_y <= 12 + y_loc + disy_n  )
	       || (lcd_x >= 9 + x_loc + disx_n && lcd_x <= 12 + x_loc + disx_n && lcd_y >= 12 + y_loc + disy_n && lcd_y <= 15 + y_loc + disy_n ) )begin
	       lcd_track <= `RED;
	   end
	   
	   //S
	   else if( (lcd_x >= 3 + x_loc + disx_s && lcd_x <= 15 + x_loc + disx_s && lcd_y >= 0 + y_loc + disy_s && lcd_y <= 3 + y_loc + disy_s ) 
	       || (lcd_x >= 0 + x_loc + disx_s && lcd_x <= 3 + x_loc + disx_s && lcd_y >= 3 + y_loc + disy_s && lcd_y <= 9 + y_loc + disy_s )
	       || (lcd_x >= 3 + x_loc + disx_s && lcd_x <= 12 + x_loc + disx_s && lcd_y >= 9 + y_loc + disy_s && lcd_y <= 12 + y_loc + disy_s  )
	       || (lcd_x >= 12 + x_loc + disx_s && lcd_x <= 15 + x_loc + disx_s && lcd_y >= 12 + y_loc + disy_s && lcd_y <= 18 + y_loc + disy_s  )
	       || (lcd_x >= 0 + x_loc + disx_s && lcd_x <= 12 + x_loc + disx_s && lcd_y >= 18 + y_loc + disy_s && lcd_y <= 21 + y_loc + disy_s ) )begin
	       lcd_track <= `RED;
	   end
	   
	   //R
	   else if( (lcd_x >= 0 + x_loc + disx_r && lcd_x <= 12 + x_loc + disx_r && lcd_y >= 0 + y_loc + disy_r && lcd_y <= 3 + y_loc + disy_r ) 
	       || (lcd_x >= 12 + x_loc + disx_r && lcd_x <= 15 + x_loc + disx_r && lcd_y >= 3 + y_loc + disy_r && lcd_y <= 9 + y_loc + disy_r )
	       || (lcd_x >= 0 + x_loc + disx_r && lcd_x <= 12 + x_loc + disx_r && lcd_y >= 9 + y_loc + disy_r && lcd_y <= 12 + y_loc + disy_r  )
	       || (lcd_x >= 0 + x_loc + disx_r && lcd_x <= 3 + x_loc + disx_r && lcd_y >= 0 + y_loc + disy_r && lcd_y <= 21 + y_loc + disy_r  )
	       || (lcd_x >= 6 + x_loc + disx_r && lcd_x <= 9 + x_loc + disx_r && lcd_y >= 12 + y_loc + disy_r && lcd_y <= 15 + y_loc + disy_r )
	       || (lcd_x >= 9 + x_loc + disx_r && lcd_x <= 12 + x_loc + disx_r && lcd_y >= 15 + y_loc + disy_r && lcd_y <= 18 + y_loc + disy_r )
	       || (lcd_x >= 12 + x_loc + disx_r && lcd_x <= 15 + x_loc + disx_r && lcd_y >= 18 + y_loc + disy_r && lcd_y <= 21 + y_loc + disy_r ) )begin
	       lcd_track <= `RED;
	   end
	   
	   //B
	   else if( (lcd_x >= 0 + x_loc + disx_b && lcd_x <= 12 + x_loc + disx_b && lcd_y >= 0 + y_loc + disy_b && lcd_y <= 3 + y_loc + disy_b ) 
	       || (lcd_x >= 0 + x_loc + disx_b && lcd_x <= 3 + x_loc + disx_b && lcd_y >= 0 + y_loc + disy_b && lcd_y <= 21 + y_loc + disy_b )
	       || (lcd_x >= 12 + x_loc + disx_b && lcd_x <= 15 + x_loc + disx_b && lcd_y >= 3 + y_loc + disy_b && lcd_y <= 9 + y_loc + disy_b  )
	       || (lcd_x >= 0 + x_loc + disx_b && lcd_x <= 12 + x_loc + disx_b && lcd_y >= 9 + y_loc + disy_b && lcd_y <= 12 + y_loc + disy_b )
	       || (lcd_x >= 12 + x_loc + disx_b && lcd_x <= 15 + x_loc + disx_b && lcd_y >= 12 + y_loc + disy_b && lcd_y <= 18 + y_loc + disy_b ) 
	       || (lcd_x >= 0 + x_loc + disx_b && lcd_x <= 12 + x_loc + disx_b && lcd_y >= 18 + y_loc + disy_b && lcd_y <= 21 + y_loc + disy_b )  )begin
	       lcd_track <= `RED;
	   end
	   
	   //D
	   else if( (lcd_x >= 0 + x_loc + disx_d && lcd_x <= 12 + x_loc + disx_d && lcd_y >= 0 + y_loc + disy_p && lcd_y <= 3 + y_loc + disy_p ) 
	       || (lcd_x >= 0 + x_loc + disx_d && lcd_x <= 3 + x_loc + disx_d && lcd_y >= 0 + y_loc + disy_p && lcd_y <= 21 + y_loc + disy_p )
	       || (lcd_x >= 12 + x_loc + disx_d && lcd_x <= 15 + x_loc + disx_d && lcd_y >= 3 + y_loc + disy_p && lcd_y <= 18 + y_loc + disy_p  )
	       || (lcd_x >= 0 + x_loc + disx_d && lcd_x <= 12 + x_loc + disx_d && lcd_y >= 18 + y_loc + disy_p && lcd_y <= 21 + y_loc + disy_p ) )begin
	       lcd_track <= `RED;
	   end
	   
	   //numbers
	   //0
	   else if( (lcd_x >= 3 + x_loc_n + disx_0 && lcd_x <= 12 + x_loc_n + disx_0 && lcd_y >= 0 + y_loc_n + disy_0 && lcd_y <= 3 + y_loc_n + disy_0 )
	       || (lcd_x >= 3 + x_loc_n + disx_0 && lcd_x <= 12 + x_loc_n + disx_0 && lcd_y >= 18 + y_loc_n + disy_0 && lcd_y <= 21 + y_loc_n + disy_0 ) 
	       || (lcd_x >= 0 + x_loc_n + disx_0 && lcd_x <= 3 + x_loc_n + disx_0 && lcd_y >= 3 + y_loc_n + disy_0 && lcd_y <= 18 + y_loc_n + disy_0 ) 
	       || (lcd_x >= 12 + x_loc_n + disx_0 && lcd_x <= 15 + x_loc_n + disx_0 && lcd_y >= 3 + y_loc_n + disy_0 && lcd_y <= 18 + y_loc_n + disy_0 ) 
	       || (lcd_x >= 9 + x_loc_n + disx_0 && lcd_x <= 12 + x_loc_n + disx_0 && lcd_y >= 6 + y_loc_n + disy_0 && lcd_y <= 9 + y_loc_n + disy_0 ) 
	       || (lcd_x >= 6 + x_loc_n + disx_0 && lcd_x <= 9 + x_loc_n + disx_0 && lcd_y >= 9 + y_loc_n + disy_0 && lcd_y <= 12 + y_loc_n + disy_0 )
	       || (lcd_x >= 3 + x_loc_n + disx_0 && lcd_x <= 6 + x_loc_n + disx_0 && lcd_y >= 12 + y_loc_n + disy_0 && lcd_y <= 15 + y_loc_n + disy_0 ) )begin
	       lcd_track <= `RED;
	   end
	   
	   // 1
	   else if( (lcd_x >= 6 + x_loc_n + disx_1 && lcd_x <= 9 + x_loc_n + disx_1 && lcd_y >= 0 + y_loc_n + disy_1 && lcd_y <= 21 + y_loc_n + disy_1 ) 
	       || (lcd_x >= 3 + x_loc_n + disx_1 && lcd_x <= 9 + x_loc_n + disx_1 && lcd_y >= 3 + y_loc_n + disy_1 && lcd_y <= 6 + y_loc_n + disy_1 )
	       || (lcd_x >= 3 + x_loc_n + disx_1 && lcd_x <= 12 + x_loc_n + disx_1 && lcd_y >= 18 + y_loc_n + disy_1 && lcd_y <= 21 + y_loc_n + disy_1  ) )begin
	       lcd_track <= `RED;
	   end
	   
	   // 2
	   else if( (lcd_x >= 0 + x_loc_n + disx_2 && lcd_x <= 3 + x_loc_n + disx_2 && lcd_y >= 3 + y_loc_n + disy_2 && lcd_y <= 6 + y_loc_n + disy_2 ) 
	       || (lcd_x >= 3 + x_loc_n + disx_2 && lcd_x <= 12 + x_loc_n + disx_2 && lcd_y >= 0 + y_loc_n + disy_2 && lcd_y <= 3 + y_loc_n + disy_2 )
	       || (lcd_x >= 12 + x_loc_n + disx_2 && lcd_x <= 15 + x_loc_n + disx_2 && lcd_y >= 3 + y_loc_n + disy_2 && lcd_y <= 9 + y_loc_n + disy_2 ) 
	       || (lcd_x >= 9 + x_loc_n + disx_2 && lcd_x <= 12 + x_loc_n + disx_2 && lcd_y >= 9 + y_loc_n + disy_2 && lcd_y <= 12 + y_loc_n + disy_2 ) 
	       || (lcd_x >= 6 + x_loc_n + disx_2 && lcd_x <= 9 + x_loc_n + disx_2 && lcd_y >= 12 + y_loc_n + disy_2 && lcd_y <= 15 + y_loc_n + disy_2 ) 
	       || (lcd_x >= 3 + x_loc_n + disx_2 && lcd_x <= 6 + x_loc_n + disx_2 && lcd_y >= 15 + y_loc_n + disy_2 && lcd_y <= 18 + y_loc_n + disy_2 ) 
	       || (lcd_x >= 0 + x_loc_n + disx_2 && lcd_x <= 15 + x_loc_n + disx_2 && lcd_y >= 18 + y_loc_n + disy_2 && lcd_y <= 21 + y_loc_n + disy_2 ) )begin
	       lcd_track <= `RED;
	   end
	   
	   // 3
	   else if( (lcd_x >= 0 + x_loc_n + disx_3 && lcd_x <= 15 + x_loc_n + disx_3 && lcd_y >= 0 + y_loc_n + disy_3 && lcd_y <= 3 + y_loc_n + disy_3 ) 
	       || (lcd_x >= 9 + x_loc_n + disx_3 && lcd_x <= 12 + x_loc_n + disx_3 && lcd_y >= 3 + y_loc_n + disy_3 && lcd_y <= 6 + y_loc_n + disy_3 )
	       || (lcd_x >= 6 + x_loc_n + disx_3 && lcd_x <= 9 + x_loc_n + disx_3 && lcd_y >= 6 + y_loc_n + disy_3 && lcd_y <= 9 + y_loc_n + disy_3 ) 
	       || (lcd_x >= 9 + x_loc_n + disx_3 && lcd_x <= 12 + x_loc_n + disx_3 && lcd_y >= 9 + y_loc_n + disy_3 && lcd_y <= 12 + y_loc_n + disy_3 ) 
	       || (lcd_x >= 12 + x_loc_n + disx_3 && lcd_x <= 15 + x_loc_n + disx_3 && lcd_y >= 12 + y_loc_n + disy_3 && lcd_y <= 18 + y_loc_n + disy_3 ) 
	       || (lcd_x >= 3 + x_loc_n + disx_3 && lcd_x <= 12 + x_loc_n + disx_3 && lcd_y >= 18 + y_loc_n + disy_3 && lcd_y <= 21 + y_loc_n + disy_3 ) 
	       || (lcd_x >= 0 + x_loc_n + disx_3 && lcd_x <= 3 + x_loc_n + disx_3 && lcd_y >= 15 + y_loc_n + disy_3 && lcd_y <= 18 + y_loc_n + disy_3 ) )begin
	       lcd_track <= `RED;
	   end
	   
	   // 4
	   else if( (lcd_x >= 0 + x_loc_n + disx_4 && lcd_x <= 3 + x_loc_n + disx_4 && lcd_y >= 9 + y_loc_n + disy_4 && lcd_y <= 15 + y_loc_n + disy_4 ) 
	       || (lcd_x >= 3 + x_loc_n + disx_4 && lcd_x <= 6 + x_loc_n + disx_4 && lcd_y >= 6 + y_loc_n + disy_4 && lcd_y <= 9 + y_loc_n + disy_4 )
	       || (lcd_x >= 6 + x_loc_n + disx_4 && lcd_x <= 9 + x_loc_n + disx_4 && lcd_y >= 3 + y_loc_n + disy_4 && lcd_y <= 6 + y_loc_n + disy_4 ) 
	       || (lcd_x >= 9 + x_loc_n + disx_4 && lcd_x <= 12 + x_loc_n + disx_4 && lcd_y >= 0 + y_loc_n + disy_4 && lcd_y <= 21 + y_loc_n + disy_4 ) 
	       || (lcd_x >= 0 + x_loc_n + disx_4 && lcd_x <= 15 + x_loc_n + disx_4 && lcd_y >= 12 + y_loc_n + disy_4 && lcd_y <= 15 + y_loc_n + disy_4 ))begin
	       lcd_track <= `RED;
	   end
	   
	   //5
	   else if( (lcd_x >= 0 + x_loc_n + disx_5 && lcd_x <= 15 + x_loc_n + disx_5 && lcd_y >= 0 + y_loc_n + disy_5 && lcd_y <= 3 + y_loc_n + disy_5 ) 
	       || (lcd_x >= 0 + x_loc_n + disx_5 && lcd_x <= 3 + x_loc_n + disx_5 && lcd_y >= 3 + y_loc_n + disy_5 && lcd_y <= 6 + y_loc_n + disy_5 )
	       || (lcd_x >= 0 + x_loc_n + disx_5 && lcd_x <= 12 + x_loc_n + disx_5 && lcd_y >= 6 + y_loc_n + disy_5 && lcd_y <= 9 + y_loc_n + disy_5 ) 
	       || (lcd_x >= 12 + x_loc_n + disx_5 && lcd_x <= 15 + x_loc_n + disx_5 && lcd_y >= 9 + y_loc_n + disy_5 && lcd_y <= 18 + y_loc_n + disy_5 ) 
	       || (lcd_x >= 3 + x_loc_n + disx_5 && lcd_x <= 12 + x_loc_n + disx_5 && lcd_y >= 18 + y_loc_n + disy_5 && lcd_y <= 21 + y_loc_n + disy_5 ) 
	       || (lcd_x >= 0 + x_loc_n + disx_5 && lcd_x <= 3 + x_loc_n + disx_5 && lcd_y >= 15 + y_loc_n + disy_5 && lcd_y <= 18 + y_loc_n + disy_5 ))begin
	       lcd_track <= `RED;
	   end
	   
	   //6
	   else if( (lcd_x >= 6 + x_loc_n + disx_6 && lcd_x <= 12 + x_loc_n + disx_6 && lcd_y >= 0 + y_loc_n + disy_6 && lcd_y <= 3 + y_loc_n + disy_6 ) 
	       || (lcd_x >= 3 + x_loc_n + disx_6 && lcd_x <= 6 + x_loc_n + disx_6 && lcd_y >= 3 + y_loc_n + disy_6 && lcd_y <= 6 + y_loc_n + disy_6 )
	       || (lcd_x >= 0 + x_loc_n + disx_6 && lcd_x <= 3 + x_loc_n + disx_6 && lcd_y >= 6 + y_loc_n + disy_6 && lcd_y <= 18 + y_loc_n + disy_6 ) 
	       || (lcd_x >= 0 + x_loc_n + disx_6 && lcd_x <= 12 + x_loc_n + disx_6 && lcd_y >= 9 + y_loc_n + disy_6 && lcd_y <= 12 + y_loc_n + disy_6 ) 
	       || (lcd_x >= 12 + x_loc_n + disx_6 && lcd_x <= 15 + x_loc_n + disx_6 && lcd_y >= 12 + y_loc_n + disy_6 && lcd_y <= 18 + y_loc_n + disy_6 )
	       || (lcd_x >= 3 + x_loc_n + disx_6 && lcd_x <= 12 + x_loc_n + disx_6 && lcd_y >= 18 + y_loc_n + disy_6 && lcd_y <= 21 + y_loc_n + disy_6 ) )begin
	       lcd_track <= `RED;
	   end
	   
	   //7
	   else if( (lcd_x >= 0 + x_loc_n + disx_7 && lcd_x <= 15 + x_loc_n + disx_7 && lcd_y >= 0 + y_loc_n + disy_7 && lcd_y <= 3 + y_loc_n + disy_7 ) 
	       || (lcd_x >= 12 + x_loc_n + disx_7 && lcd_x <= 15 + x_loc_n + disx_7 && lcd_y >= 3 + y_loc_n + disy_7 && lcd_y <= 6 + y_loc_n + disy_7 )
	       || (lcd_x >= 9 + x_loc_n + disx_7 && lcd_x <= 12 + x_loc_n + disx_7 && lcd_y >= 6 + y_loc_n + disy_7 && lcd_y <= 9 + y_loc_n + disy_7 ) 
	       || (lcd_x >= 6 + x_loc_n + disx_7 && lcd_x <= 9 + x_loc_n + disx_7 && lcd_y >= 9 + y_loc_n + disy_7 && lcd_y <= 12 + y_loc_n + disy_7 ) 
	       || (lcd_x >= 3 + x_loc_n + disx_7 && lcd_x <= 6 + x_loc_n + disx_7 && lcd_y >= 12 + y_loc_n + disy_7 && lcd_y <= 21 + y_loc_n + disy_7 ) )begin
	       lcd_track <= `RED;
	   end
	   
	   //8
	   else if( (lcd_x >= 3 + x_loc_n + disx_8 && lcd_x <= 12 + x_loc_n + disx_8 && lcd_y >= 0 + y_loc_n + disy_8 && lcd_y <= 3 + y_loc_n + disy_8 ) 
	       || (lcd_x >= 3 + x_loc_n + disx_8 && lcd_x <= 12 + x_loc_n + disx_8 && lcd_y >= 9 + y_loc_n + disy_8 && lcd_y <= 12 + y_loc_n + disy_8 )
	       || (lcd_x >= 3 + x_loc_n + disx_8 && lcd_x <= 12 + x_loc_n + disx_8 && lcd_y >= 18 + y_loc_n + disy_8 && lcd_y <= 21 + y_loc_n + disy_8 ) 
	       || (lcd_x >= 0 + x_loc_n + disx_8 && lcd_x <= 3 + x_loc_n + disx_8 && lcd_y >= 3 + y_loc_n + disy_8 && lcd_y <= 9 + y_loc_n + disy_8 ) 
	       || (lcd_x >= 0 + x_loc_n + disx_8 && lcd_x <= 3 + x_loc_n + disx_8 && lcd_y >= 12 + y_loc_n + disy_8 && lcd_y <= 18 + y_loc_n + disy_8 ) 
	       || (lcd_x >= 12 + x_loc_n + disx_8 && lcd_x <= 15 + x_loc_n + disx_8 && lcd_y >= 3 + y_loc_n + disy_8 && lcd_y <= 9 + y_loc_n + disy_8 ) 
	       || (lcd_x >= 12 + x_loc_n + disx_8 && lcd_x <= 15 + x_loc_n + disx_8 && lcd_y >= 12 + y_loc_n + disy_8 && lcd_y <= 18 + y_loc_n + disy_8 ))begin
	       lcd_track <= `RED;
	   end
	   
	   //9
	   else if( (lcd_x >= 3 + x_loc_n + disx_9 && lcd_x <= 12 + x_loc_n + disx_9 && lcd_y >= 0 + y_loc_n + disy_9 && lcd_y <= 3 + y_loc_n + disy_9 ) 
	       || (lcd_x >= 3 + x_loc_n + disx_9 && lcd_x <= 12 + x_loc_n + disx_9 && lcd_y >= 9 + y_loc_n + disy_9 && lcd_y <= 12 + y_loc_n + disy_9 )
	       || (lcd_x >= 3 + x_loc_n + disx_9 && lcd_x <= 9 + x_loc_n + disx_9 && lcd_y >= 18 + y_loc_n + disy_9 && lcd_y <= 21 + y_loc_n + disy_9 ) 
	       || (lcd_x >= 0 + x_loc_n + disx_9 && lcd_x <= 3 + x_loc_n + disx_9 && lcd_y >= 3 + y_loc_n + disy_9 && lcd_y <= 9 + y_loc_n + disy_9 ) 
	       || (lcd_x >= 12 + x_loc_n + disx_9 && lcd_x <= 15 + x_loc_n + disx_9 && lcd_y >= 3 + y_loc_n + disy_9 && lcd_y <= 15 + y_loc_n + disy_9 ) 
	       || (lcd_x >= 9 + x_loc_n + disx_9 && lcd_x <= 12 + x_loc_n + disx_9 && lcd_y >= 15 + y_loc_n + disy_9 && lcd_y <= 18 + y_loc_n + disy_9 ))begin
	       lcd_track <= `RED;
	   end
	   
	   // frame
	   else if(lcd_y == 280 && lcd_x >= 120 && lcd_x <= 440
		|| lcd_y == 510 && lcd_x >= 120 && lcd_x <= 440
		|| lcd_x == 120 && lcd_y >= 280 && lcd_y <= 510
		|| lcd_x == 440 && lcd_y >= 280 && lcd_y <= 510)
		lcd_track <= `RED;
	else 
	   lcd_track <= 0;
end
end
endmodule

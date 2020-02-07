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

    input sw1,
    output reg [15:0]	lcd_track
    );
    
    reg 	[2:0] track_en;
reg [9:0] y_g;
reg [9:0] x_g;
reg [9:0] x_loc;
reg [9:0] y_loc;
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

always@(posedge clk or negedge rst_n)begin
	if(!rst_n) begin
	   lcd_track <= 0;
	end
	else begin
	   x_loc <= 150;
	   y_loc <= 300;
	   
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

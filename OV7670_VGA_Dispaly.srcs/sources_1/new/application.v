`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/06 21:32:38
// Design Name: 
// Module Name: application
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


module application(
    input clk,
    input rst_n,
    input [11:0] x_center,
    input [11:0] y_center,
    input  [9:0] lcd_x,
    input  [9:0] lcd_y,

    input sw1,
    output reg [15:0]	lcd_block,
    output reg flag
    );

reg 	[2:0] block_en;
reg [9:0] y_g;
reg [9:0] x_g;
reg [31:0] cnt;
reg       cnt_clk;

reg [9:0] x_loc;
reg [9:0] y_loc;

reg [9:0] disx_a;
reg [9:0] disy_a;

reg [9:0] disx_p;
reg [9:0] disy_p;

reg [9:0] disx_p2;
reg [9:0] disy_p2;

reg [9:0] disx_l;
reg [9:0] disy_l;

reg [9:0] disx_i;
reg [9:0] disy_i;

reg [9:0] disx_c;
reg [9:0] disy_c;

reg [9:0] disx_a2;
reg [9:0] disy_a2;

reg [9:0] disx_t;
reg [9:0] disy_t;

reg [9:0] disx_i2;
reg [9:0] disy_i2;

reg [9:0] disx_o;
reg [9:0] disy_o;


reg [9:0] disx_n;
reg [9:0] disy_n;

always@(posedge clk or negedge rst_n)begin
	if(!rst_n) begin
		block_en <= 3'b000;
		x_g <= 600;
		y_g <= 70;
		cnt <= 0;
		lcd_block <= 0;
	end
	
	else if (sw1 == 1 ) begin
	   if(lcd_y >= y_g - 5 && lcd_y <= y_g + 5 && lcd_x >= x_g - 5 && lcd_x <= x_g + 5 && flag == 0)begin
	       lcd_block <= `GREEN;
	   end
	
	   else if(lcd_y >= y_center + 30 - 5 && lcd_y <= y_center + 30 + 5 
	           && lcd_x >= x_center + 390 - 5 && lcd_x <= x_center + 390 + 5)begin
				lcd_block <= `BLUE;
			end
	   
	   else if(lcd_y == 40 && lcd_x >= 440 && lcd_x <= 780
				|| lcd_y == 280 && lcd_x >= 440 && lcd_x <= 780
				|| lcd_x == 440 && lcd_y >= 40 && lcd_y <= 280
				|| lcd_x == 780 && lcd_y >= 40 && lcd_y <= 280)begin
				lcd_block <= `BLUE;
			end
       
		else 
			lcd_block <= 0;
	   
		cnt <= cnt + 1;
		if(y_g >= 240 || flag == 1) begin
			y_g <= 70;
			cnt <= 0;
		end
		
		else if(cnt == 25000000) begin
			     y_g <= y_g + 10;
			     cnt <= 0;
		     end
	end
	
	else begin
	   x_loc <= 500;
	   y_loc <= 50;
	   
	   disx_a <= 0;
	   disx_a <= 0;
	   
	   disx_p <= 18;
	   disy_p <= 0;
	   
	   disx_p2 <= 36;
	   disy_p2 <= 0;
	   
	   disx_l <= 54;
	   disy_l <= 0;
	   
	   disx_i <= 72;
	   disy_i <= 0;
	   
	   disx_c <= 90;
	   disy_c <= 0;
	   
	   disx_a2 <= 108;
	   disy_a2 <= 0;
	   
	   disx_t <= 126;
	   disy_t <= 0;
	   
	   disx_i2 <= 144;
	   disy_i2 <= 0;
	   
	   disx_o <= 162;
	   disy_o <= 0;


	   disx_n <= 180;
	   disy_n <= 0;
	   // A
	   if( (lcd_x >= 3 + x_loc + disx_a && lcd_x <= 12 + x_loc + disx_a && lcd_y >= 0 + y_loc + disy_a && lcd_y <= 3 + y_loc + disy_a ) 
	       || (lcd_x >= 0 + x_loc + disx_a && lcd_x <= 3 + x_loc + disx_a && lcd_y >= 3 + y_loc + disy_a && lcd_y <= 21 + y_loc + disy_a )
	       || (lcd_x >= 12 + x_loc + disx_a && lcd_x <= 15 + x_loc + disx_a && lcd_y >= 3 + y_loc + disy_a && lcd_y <= 21 + y_loc + disy_a )
	       || (lcd_x >= 0 + x_loc+ disx_a  && lcd_x <= 15 + x_loc + disx_a && lcd_y >= 9 + y_loc + disy_a && lcd_y <= 12 + y_loc + disy_a ) )begin
	       lcd_block <= `BLUE;
	   end

        // P
	   else if( (lcd_x >= 0 + x_loc + disx_p && lcd_x <= 12 + x_loc + disx_p && lcd_y >= 0 + y_loc + disy_p && lcd_y <= 3 + y_loc + disy_p ) 
	       || (lcd_x >= 0 + x_loc + disx_p && lcd_x <= 3 + x_loc + disx_p && lcd_y >= 0 + y_loc + disy_p && lcd_y <= 21 + y_loc + disy_p )
	       || (lcd_x >= 12 + x_loc + disx_p && lcd_x <= 15 + x_loc + disx_p && lcd_y >= 3 + y_loc + disy_p && lcd_y <= 9 + y_loc + disy_p  )
	       || (lcd_x >= 0 + x_loc + disx_p && lcd_x <= 12 + x_loc + disx_p && lcd_y >= 9 + y_loc + disy_p && lcd_y <= 12 + y_loc + disy_p ) )begin
	       lcd_block <= `BLUE;
	   end
	   
	   // P2
	   else if( (lcd_x >= 0 + x_loc + disx_p2 && lcd_x <= 12 + x_loc + disx_p2 && lcd_y >= 0 + y_loc + disy_p2 && lcd_y <= 3 + y_loc + disy_p2 ) 
	       || (lcd_x >= 0 + x_loc + disx_p2 && lcd_x <= 3 + x_loc + disx_p2 && lcd_y >= 0 + y_loc + disy_p2 && lcd_y <= 21 + y_loc + disy_p2 )
	       || (lcd_x >= 12 + x_loc + disx_p2 && lcd_x <= 15 + x_loc + disx_p2 && lcd_y >= 3 + y_loc + disy_p2 && lcd_y <= 9 + y_loc + disy_p2  )
	       || (lcd_x >= 0 + x_loc + disx_p2 && lcd_x <= 12 + x_loc + disx_p2 && lcd_y >= 9 + y_loc + disy_p2 && lcd_y <= 12 + y_loc + disy_p2 ) )begin
	       lcd_block <= `BLUE;
	   end
	   
	   // L
	   else if( (lcd_x >= 0 + x_loc + disx_l && lcd_x <= 3 + x_loc + disx_l && lcd_y >= 0 + y_loc + disy_l && lcd_y <= 21 + y_loc + disy_l ) 
	       || (lcd_x >= 0 + x_loc + disx_l && lcd_x <= 15 + x_loc + disx_l && lcd_y >= 18 + y_loc + disy_l && lcd_y <= 21 + y_loc + disy_l ) )begin
	       lcd_block <= `BLUE;
	   end
	   
	   // I
	   else if( (lcd_x >= 3 + x_loc + disx_i && lcd_x <= 12 + x_loc + disx_i && lcd_y >= 0 + y_loc + disy_i && lcd_y <= 3 + y_loc + disy_i ) 
	       || (lcd_x >= 6 + x_loc + disx_i && lcd_x <= 9 + x_loc + disx_i && lcd_y >= 0 + y_loc + disy_i && lcd_y <= 21 + y_loc + disy_i )
	       || (lcd_x >= 3 + x_loc + disx_i && lcd_x <= 12 + x_loc + disx_i && lcd_y >= 18 + y_loc + disy_i && lcd_y <= 21 + y_loc + disy_i  ) )begin
	       lcd_block <= `BLUE;
	   end
	   
	   // C
	   else if( (lcd_x >= 3 + x_loc + disx_c && lcd_x <= 12 + x_loc + disx_c && lcd_y >= 0 + y_loc + disy_c && lcd_y <= 3 + y_loc + disy_c ) 
	       || (lcd_x >= 0 + x_loc + disx_c && lcd_x <= 3 + x_loc + disx_c && lcd_y >= 3 + y_loc + disy_c && lcd_y <= 18 + y_loc + disy_c )
	       || (lcd_x >= 3 + x_loc + disx_c && lcd_x <= 12 + x_loc + disx_c && lcd_y >= 18 + y_loc + disy_c && lcd_y <= 21 + y_loc + disy_c  )
	       || (lcd_x >= 12 + x_loc + disx_c && lcd_x <= 15 + x_loc + disx_c && lcd_y >= 3 + y_loc + disy_c && lcd_y <= 6 + y_loc + disy_c  )
	       || (lcd_x >= 12 + x_loc + disx_c && lcd_x <= 15 + x_loc + disx_c && lcd_y >= 15 + y_loc + disy_c && lcd_y <= 18 + y_loc + disy_c ) )begin
	       lcd_block <= `BLUE;
	   end
	   
	   // A2
	   else if( (lcd_x >= 3 + x_loc + disx_a2 && lcd_x <= 12 + x_loc + disx_a2 && lcd_y >= 0 + y_loc + disy_a2 && lcd_y <= 3 + y_loc + disy_a2 ) 
	       || (lcd_x >= 0 + x_loc + disx_a2 && lcd_x <= 3 + x_loc + disx_a2 && lcd_y >= 3 + y_loc + disy_a2 && lcd_y <= 21 + y_loc + disy_a2 )
	       || (lcd_x >= 12 + x_loc + disx_a2 && lcd_x <= 15 + x_loc + disx_a2 && lcd_y >= 3 + y_loc + disy_a2 && lcd_y <= 21 + y_loc + disy_a2 )
	       || (lcd_x >= 0 + x_loc+ disx_a2  && lcd_x <= 15 + x_loc + disx_a2 && lcd_y >= 9 + y_loc + disy_a2 && lcd_y <= 12 + y_loc + disy_a2 ) )begin
	       lcd_block <= `BLUE;
	   end
	   
	   // T
	   else if( (lcd_x >= 0 + x_loc + disx_t && lcd_x <= 15 + x_loc + disx_t && lcd_y >= 0 + y_loc + disy_t && lcd_y <= 3 + y_loc + disy_t ) 
	       || (lcd_x >= 6 + x_loc + disx_t && lcd_x <= 9 + x_loc + disx_t && lcd_y >= 0 + y_loc + disy_t && lcd_y <= 21 + y_loc + disy_t ) )begin
	       lcd_block <= `BLUE;
	   end
	   
	   // I2
	   else if( (lcd_x >= 3 + x_loc + disx_i2 && lcd_x <= 12 + x_loc + disx_i2 && lcd_y >= 0 + y_loc + disy_i2 && lcd_y <= 3 + y_loc + disy_i2 ) 
	       || (lcd_x >= 6 + x_loc + disx_i2 && lcd_x <= 9 + x_loc + disx_i2 && lcd_y >= 0 + y_loc + disy_i2 && lcd_y <= 21 + y_loc + disy_i2 )
	       || (lcd_x >= 3 + x_loc + disx_i2 && lcd_x <= 12 + x_loc + disx_i2 && lcd_y >= 18 + y_loc + disy_i2 && lcd_y <= 21 + y_loc + disy_i2  ) )begin
	       lcd_block <= `BLUE;
	   end

	   // O
	   else if( (lcd_x >= 3 + x_loc + disx_o && lcd_x <= 12 + x_loc + disx_o && lcd_y >= 0 + y_loc + disy_o && lcd_y <= 3 + y_loc + disy_o ) 
	       || (lcd_x >= 0 + x_loc + disx_o && lcd_x <= 3 + x_loc + disx_o && lcd_y >= 3 + y_loc + disy_o && lcd_y <= 18 + y_loc + disy_o )
	       || (lcd_x >= 12 + x_loc + disx_o && lcd_x <= 15 + x_loc + disx_o && lcd_y >= 3 + y_loc + disy_o && lcd_y <= 18 + y_loc + disy_o  )
	       || (lcd_x >= 3 + x_loc + disx_o && lcd_x <= 12 + x_loc + disx_o && lcd_y >= 18 + y_loc + disy_o && lcd_y <= 21 + y_loc + disy_o ) )begin
	       lcd_block <= `BLUE;
	   end

	   // N
	   else if( (lcd_x >= 0 + x_loc + disx_n && lcd_x <= 3 + x_loc + disx_n && lcd_y >= 0 + y_loc + disy_n && lcd_y <= 21 + y_loc + disy_n ) 
	       || (lcd_x >= 12 + x_loc + disx_n && lcd_x <= 15 + x_loc + disx_n && lcd_y >= 0 + y_loc + disy_n && lcd_y <= 21 + y_loc + disy_n )
	       || (lcd_x >= 3 + x_loc + disx_n && lcd_x <= 6 + x_loc + disx_n && lcd_y >= 6 + y_loc + disy_n && lcd_y <= 9 + y_loc + disy_n  )
	       || (lcd_x >= 6 + x_loc + disx_n && lcd_x <= 9 + x_loc + disx_n && lcd_y >= 9 + y_loc + disy_n && lcd_y <= 12 + y_loc + disy_n  )
	       || (lcd_x >= 9 + x_loc + disx_n && lcd_x <= 12 + x_loc + disx_n && lcd_y >= 12 + y_loc + disy_n && lcd_y <= 15 + y_loc + disy_n ) )begin
	       lcd_block <= `BLUE;
	   end
	   
	   // frame
      else if(lcd_y == 40 && lcd_x >= 440 && lcd_x <= 780
		  || lcd_y == 280 && lcd_x >= 440 && lcd_x <= 780
		  || lcd_x == 440 && lcd_y >= 40 && lcd_y <= 280
		  || lcd_x == 780 && lcd_y >= 40 && lcd_y <= 280)begin
		  lcd_block <= `BLUE;
       end
       
      else 
	   lcd_block <= 0;
	end
end
//-----------------------------------------------------------
//distance
reg [9:0] dist_x;
reg [9:0] dist_y;
reg [10:0] dist;

always @ (posedge clk or negedge rst_n)begin
    if (!rst_n) begin
        dist_x <= 0;
        dist_y <= 0;
    end
    else begin
        dist_x  <= ((x_center + 390) >= x_g)? (x_center + 390) - x_g : x_g - (x_center + 390);
        dist_y  <= ((y_center + 30) >= y_g)? (y_center + 30) - y_g : y_g - (y_center + 30);
    end
    dist = dist_x + dist_y;
end

//-----------------------------------------------------------
//flag 
reg flag;
always @ (posedge clk or negedge rst_n)begin
    if (!rst_n) begin
        flag <= 0;
    end
    else if ( dist <= 10 )
        flag <= 1;
    else 
        flag <= 0;
end


    
endmodule

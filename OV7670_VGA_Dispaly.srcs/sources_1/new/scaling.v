`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/06 22:57:20
// Design Name: 
// Module Name: scaling
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


module scaling(
    input clk,
    input rst_n,
    input [11:0] x_center,
    input [11:0] y_center,
    input [11:0] x_scaling,
    input [11:0] y_scaling,
    input  [9:0] lcd_x,
    input  [9:0] lcd_y,

    input sw1,
    output reg [15:0]	lcd_scaling
    );
    
reg [9:0] x_loc;
reg [9:0] y_loc;

reg [9:0] disx_s;
reg [9:0] disy_s;

reg [9:0] disx_c;
reg [9:0] disy_c;

reg [9:0] disx_a;
reg [9:0] disy_a;

reg [9:0] disx_l;
reg [9:0] disy_l;

reg [9:0] disx_i;
reg [9:0] disy_i;

reg [9:0] disx_n;
reg [9:0] disy_n;

reg [9:0] disx_g;
reg [9:0] disy_g;


always@(posedge clk or negedge rst_n)begin
	if(!rst_n) begin
	   lcd_scaling <= 0;
	end
	else if (sw1 == 0)begin
	   x_loc <= 210;
	   y_loc <= 300;
	   
	   // letters
	   disx_s <= 0;
	   disy_s <= 0;
	   
	   disx_c <= 18;
	   disy_c <= 0;
	   
	   disx_a <= 36;
	   disy_a <= 0;
	   
	   disx_l <= 54;
	   disy_l <= 0;
	   
	   disx_i <= 72;
	   disy_i <= 0;
	   
	   disx_n <= 90;
	   disy_n <= 0;
	   
	   disx_g <= 108;
	   disy_g <= 0;
	   
	   
		//S
	   if( (lcd_x >= 3 + x_loc + disx_s && lcd_x <= 15 + x_loc + disx_s && lcd_y >= 0 + y_loc + disy_s && lcd_y <= 3 + y_loc + disy_s ) 
	       || (lcd_x >= 0 + x_loc + disx_s && lcd_x <= 3 + x_loc + disx_s && lcd_y >= 3 + y_loc + disy_s && lcd_y <= 9 + y_loc + disy_s )
	       || (lcd_x >= 3 + x_loc + disx_s && lcd_x <= 12 + x_loc + disx_s && lcd_y >= 9 + y_loc + disy_s && lcd_y <= 12 + y_loc + disy_s  )
	       || (lcd_x >= 12 + x_loc + disx_s && lcd_x <= 15 + x_loc + disx_s && lcd_y >= 12 + y_loc + disy_s && lcd_y <= 18 + y_loc + disy_s  )
	       || (lcd_x >= 0 + x_loc + disx_s && lcd_x <= 12 + x_loc + disx_s && lcd_y >= 18 + y_loc + disy_s && lcd_y <= 21 + y_loc + disy_s ) )begin
	       lcd_scaling <= `RED;
	   end
	   
	   // C
	   else if( (lcd_x >= 3 + x_loc + disx_c && lcd_x <= 12 + x_loc + disx_c && lcd_y >= 0 + y_loc + disy_c && lcd_y <= 3 + y_loc + disy_c ) 
	       || (lcd_x >= 0 + x_loc + disx_c && lcd_x <= 3 + x_loc + disx_c && lcd_y >= 3 + y_loc + disy_c && lcd_y <= 18 + y_loc + disy_c )
	       || (lcd_x >= 3 + x_loc + disx_c && lcd_x <= 12 + x_loc + disx_c && lcd_y >= 18 + y_loc + disy_c && lcd_y <= 21 + y_loc + disy_c  )
	       || (lcd_x >= 12 + x_loc + disx_c && lcd_x <= 15 + x_loc + disx_c && lcd_y >= 3 + y_loc + disy_c && lcd_y <= 6 + y_loc + disy_c  )
	       || (lcd_x >= 12 + x_loc + disx_c && lcd_x <= 15 + x_loc + disx_c && lcd_y >= 15 + y_loc + disy_c && lcd_y <= 18 + y_loc + disy_c ) )begin
	       lcd_scaling <= `RED;
	   end
	   
	   // A
	   else if( (lcd_x >= 3 + x_loc + disx_a && lcd_x <= 12 + x_loc + disx_a && lcd_y >= 0 + y_loc + disy_a && lcd_y <= 3 + y_loc + disy_a ) 
			|| (lcd_x >= 0 + x_loc + disx_a && lcd_x <= 3 + x_loc + disx_a && lcd_y >= 3 + y_loc + disy_a && lcd_y <= 21 + y_loc + disy_a )
			|| (lcd_x >= 12 + x_loc + disx_a && lcd_x <= 15 + x_loc + disx_a && lcd_y >= 3 + y_loc + disy_a && lcd_y <= 21 + y_loc + disy_a )
			|| (lcd_x >= 0 + x_loc + disx_a && lcd_x <= 15 + x_loc + disx_a && lcd_y >= 9 + y_loc + disy_a && lcd_y <= 12 + y_loc + disy_a ) )begin
			lcd_scaling <= `RED;
		end
	   
	   // L
	   else if( (lcd_x >= 0 + x_loc + disx_l && lcd_x <= 3 + x_loc + disx_l && lcd_y >= 0 + y_loc + disy_l && lcd_y <= 21 + y_loc + disy_l ) 
	       || (lcd_x >= 0 + x_loc + disx_l && lcd_x <= 15 + x_loc + disx_l && lcd_y >= 18 + y_loc + disy_l && lcd_y <= 21 + y_loc + disy_l ) )begin
	       lcd_scaling <= `RED;
	   end
	   
	   // I
	   else if( (lcd_x >= 3 + x_loc + disx_i && lcd_x <= 12 + x_loc + disx_i && lcd_y >= 0 + y_loc + disy_i && lcd_y <= 3 + y_loc + disy_i ) 
	       || (lcd_x >= 6 + x_loc + disx_i && lcd_x <= 9 + x_loc + disx_i && lcd_y >= 0 + y_loc + disy_i && lcd_y <= 21 + y_loc + disy_i )
	       || (lcd_x >= 3 + x_loc + disx_i && lcd_x <= 12 + x_loc + disx_i && lcd_y >= 18 + y_loc + disy_i && lcd_y <= 21 + y_loc + disy_i  ) )begin
	       lcd_scaling <= `RED;
	   end
	   
	   // N
	   else if( (lcd_x >= 0 + x_loc + disx_n && lcd_x <= 3 + x_loc + disx_n && lcd_y >= 0 + y_loc + disy_n && lcd_y <= 21 + y_loc + disy_n ) 
	       || (lcd_x >= 12 + x_loc + disx_n && lcd_x <= 15 + x_loc + disx_n && lcd_y >= 0 + y_loc + disy_n && lcd_y <= 21 + y_loc + disy_n )
	       || (lcd_x >= 3 + x_loc + disx_n && lcd_x <= 6 + x_loc + disx_n && lcd_y >= 6 + y_loc + disy_n && lcd_y <= 9 + y_loc + disy_n  )
	       || (lcd_x >= 6 + x_loc + disx_n && lcd_x <= 9 + x_loc + disx_n && lcd_y >= 9 + y_loc + disy_n && lcd_y <= 12 + y_loc + disy_n  )
	       || (lcd_x >= 9 + x_loc + disx_n && lcd_x <= 12 + x_loc + disx_n && lcd_y >= 12 + y_loc + disy_n && lcd_y <= 15 + y_loc + disy_n ) )begin
	       lcd_scaling <= `RED;
	   end
	   
	   //G
	   else if( (lcd_x >= 3 + x_loc + disx_g && lcd_x <= 12 + x_loc + disx_g && lcd_y >= 0 + y_loc + disy_g && lcd_y <= 3 + y_loc + disy_g ) 
	       || (lcd_x >= 0 + x_loc + disx_g && lcd_x <= 3 + x_loc + disx_g && lcd_y >= 3 + y_loc + disy_g && lcd_y <= 18 + y_loc + disy_g )
	       || (lcd_x >= 12 + x_loc + disx_g && lcd_x <= 15 + x_loc + disx_g && lcd_y >= 3 + y_loc + disy_g && lcd_y <= 6 + y_loc + disy_g  )
	       || (lcd_x >= 3 + x_loc + disx_g && lcd_x <= 12 + x_loc + disx_g && lcd_y >= 18 + y_loc + disy_g && lcd_y <= 21 + y_loc + disy_g  )
	       || (lcd_x >= 9 + x_loc + disx_g && lcd_x <= 15 + x_loc + disx_g && lcd_y >= 12 + y_loc + disy_g && lcd_y <= 15 + y_loc + disy_g ) 
		   || (lcd_x >= 12 + x_loc + disx_g && lcd_x <= 15 + x_loc + disx_g && lcd_y >= 15 + y_loc + disy_g && lcd_y <= 18 + y_loc + disy_g ) )begin
	       lcd_scaling <= `RED;
	   end

	   // frame
	   else if(lcd_y == 280 && lcd_x >= 120 && lcd_x <= 440
		|| lcd_y == 510 && lcd_x >= 120 && lcd_x <= 440
		|| lcd_x == 120 && lcd_y >= 280 && lcd_y <= 510
		|| lcd_x == 440 && lcd_y >= 280 && lcd_y <= 510)
		lcd_scaling <= `RED;
		else 
	    lcd_scaling <= 0;
	end
	
	else if (sw1 == 1)begin
	   // scaling
	    if (lcd_x >= 280 - x_scaling && lcd_x <= 280 + x_scaling && lcd_y >= 395 - y_scaling && lcd_y <= 395 + y_scaling)
	    lcd_scaling <= `RED;
	   // frame
	    else if(lcd_y == 280 && lcd_x >= 120 && lcd_x <= 440
		|| lcd_y == 510 && lcd_x >= 120 && lcd_x <= 440
		|| lcd_x == 120 && lcd_y >= 280 && lcd_y <= 510
		|| lcd_x == 440 && lcd_y >= 280 && lcd_y <= 510)
		lcd_scaling <= `RED;
		else 
	    lcd_scaling <= 0;
	end
	
	else begin
	   lcd_scaling <= 0;
	end
end
endmodule

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


module scoreboard(
    input clk,
    input rst_n,
    input  flag,
    input [9:0] lcd_x,
    input [9:0] lcd_y,
    
    input sw1,
    output reg [15:0]	lcd_scoreboard
    );
    
//----------------------------------------------------------
//score
reg [7:0] score;
reg flag_inside;
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n)begin
        score <= 0;
        flag_inside <= 0;
    end
    else if (flag == 1 && flag_inside == 1) begin
        score <= score + 1;
        flag_inside <= 0;
    end
    else if(flag_inside == 0 && flag == 0)
        flag_inside <= 1;
    else begin
        score <= score;
    end
end

//----------------------------------------------------------
//transform
wire [7:0] bin;
wire [3:0] one;
wire [3:0] ten;
wire [1:0] hun;
assign bin = score;

bin_dec u_bin_dec(
    .clk(clk),
    .bin(bin),
    .rst_n(rst_n),
    .one(one),
    .ten(ten),
    .hun(hun),
    .count(),
    .shift_reg()
    );

//----------------------------------------------------------
//display
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

reg [9:0] x_loc_n;
reg [9:0] y_loc_n;

//letters
reg [9:0] x_loc;
reg [9:0] y_loc;

reg [9:0] disx_s;
reg [9:0] disy_s;

reg [9:0] disx_c;
reg [9:0] disy_c;

reg [9:0] disx_o;
reg [9:0] disy_o;

reg [9:0] disx_r;
reg [9:0] disy_r;

reg [9:0] disx_e;
reg [9:0] disy_e;

reg [9:0] disx_b;
reg [9:0] disy_b;

reg [9:0] disx_o2;
reg [9:0] disy_o2;

reg [9:0] disx_a;
reg [9:0] disy_a;

reg [9:0] disx_r2;
reg [9:0] disy_r2;

reg [9:0] disx_d;
reg [9:0] disy_d;

always @ (posedge clk or negedge rst_n) begin
		if (!rst_n)begin
			lcd_scoreboard <= 0;
		end

		else if (sw1 == 1)begin
		    x_loc_n <= 500;
			y_loc_n <= 300;
		    lcd_scoreboard <= 0;
			//frame
			if(lcd_y == 280 && lcd_x >= 440 && lcd_x <= 780
				|| lcd_y == 510 && lcd_x >= 440 && lcd_x <= 780
				|| lcd_x == 440 && lcd_y >= 280 && lcd_y <= 510
				|| lcd_x == 780 && lcd_y >= 280 && lcd_y <= 510)begin
				lcd_scoreboard <= `GREEN;
			end

			else if (lcd_x >= 497 && lcd_x <= 517) begin
		
				if (ten == 0) begin
					disx_0 <= 0;
					disy_0 <= 0;
				
					if( (lcd_x >= 3 + x_loc_n + disx_0 && lcd_x <= 12 + x_loc_n + disx_0 && lcd_y >= 0 + y_loc_n + disy_0 && lcd_y <= 3 + y_loc_n + disy_0 )
					   || (lcd_x >= 3 + x_loc_n + disx_0 && lcd_x <= 12 + x_loc_n + disx_0 && lcd_y >= 18 + y_loc_n + disy_0 && lcd_y <= 21 + y_loc_n + disy_0 ) 
					   || (lcd_x >= 0 + x_loc_n + disx_0 && lcd_x <= 3 + x_loc_n + disx_0 && lcd_y >= 3 + y_loc_n + disy_0 && lcd_y <= 18 + y_loc_n + disy_0 ) 
					   || (lcd_x >= 12 + x_loc_n + disx_0 && lcd_x <= 15 + x_loc_n + disx_0 && lcd_y >= 3 + y_loc_n + disy_0 && lcd_y <= 18 + y_loc_n + disy_0 ) 
					   || (lcd_x >= 9 + x_loc_n + disx_0 && lcd_x <= 12 + x_loc_n + disx_0 && lcd_y >= 6 + y_loc_n + disy_0 && lcd_y <= 9 + y_loc_n + disy_0 ) 
					   || (lcd_x >= 6 + x_loc_n + disx_0 && lcd_x <= 9 + x_loc_n + disx_0 && lcd_y >= 9 + y_loc_n + disy_0 && lcd_y <= 12 + y_loc_n + disy_0 )
					   || (lcd_x >= 3 + x_loc_n + disx_0 && lcd_x <= 6 + x_loc_n + disx_0 && lcd_y >= 12 + y_loc_n + disy_0 && lcd_y <= 15 + y_loc_n + disy_0 ) )begin
					   lcd_scoreboard <= `GREEN;
					end
					
					else
					lcd_scoreboard <= 0;
					
				end
				
				else if (ten == 1) begin
			
					disx_1 <= 0;
					disy_1 <= 0;
					if( (lcd_x >= 6 + x_loc_n + disx_1 && lcd_x <= 9 + x_loc_n + disx_1 && lcd_y >= 0 + y_loc_n + disy_1 && lcd_y <= 21 + y_loc_n + disy_1 ) 
					   || (lcd_x >= 3 + x_loc_n + disx_1 && lcd_x <= 9 + x_loc_n + disx_1 && lcd_y >= 3 + y_loc_n + disy_1 && lcd_y <= 6 + y_loc_n + disy_1 )
					   || (lcd_x >= 3 + x_loc_n + disx_1 && lcd_x <= 12 + x_loc_n + disx_1 && lcd_y >= 18 + y_loc_n + disy_1 && lcd_y <= 21 + y_loc_n + disy_1  ) )begin
					   lcd_scoreboard <= `GREEN;
					end
					else
					   lcd_scoreboard <= 0;
				
				end
			
				else if (ten == 2) begin
					disx_2 <= 0;
					disy_2 <= 0;
					if( (lcd_x >= 0 + x_loc_n + disx_2 && lcd_x <= 3 + x_loc_n + disx_2 && lcd_y >= 3 + y_loc_n + disy_2 && lcd_y <= 6 + y_loc_n + disy_2 ) 
					   || (lcd_x >= 3 + x_loc_n + disx_2 && lcd_x <= 12 + x_loc_n + disx_2 && lcd_y >= 0 + y_loc_n + disy_2 && lcd_y <= 3 + y_loc_n + disy_2 )
					   || (lcd_x >= 12 + x_loc_n + disx_2 && lcd_x <= 15 + x_loc_n + disx_2 && lcd_y >= 3 + y_loc_n + disy_2 && lcd_y <= 9 + y_loc_n + disy_2 ) 
					   || (lcd_x >= 9 + x_loc_n + disx_2 && lcd_x <= 12 + x_loc_n + disx_2 && lcd_y >= 9 + y_loc_n + disy_2 && lcd_y <= 12 + y_loc_n + disy_2 ) 
					   || (lcd_x >= 6 + x_loc_n + disx_2 && lcd_x <= 9 + x_loc_n + disx_2 && lcd_y >= 12 + y_loc_n + disy_2 && lcd_y <= 15 + y_loc_n + disy_2 ) 
					   || (lcd_x >= 3 + x_loc_n + disx_2 && lcd_x <= 6 + x_loc_n + disx_2 && lcd_y >= 15 + y_loc_n + disy_2 && lcd_y <= 18 + y_loc_n + disy_2 ) 
					   || (lcd_x >= 0 + x_loc_n + disx_2 && lcd_x <= 15 + x_loc_n + disx_2 && lcd_y >= 18 + y_loc_n + disy_2 && lcd_y <= 21 + y_loc_n + disy_2 ) )begin
					   lcd_scoreboard <= `GREEN;
					end
					else
					   lcd_scoreboard <= 0;
				end
				
				else if (ten == 3) begin
					disx_3 <= 0;
					disy_3 <= 0;
					if( (lcd_x >= 0 + x_loc_n + disx_3 && lcd_x <= 15 + x_loc_n + disx_3 && lcd_y >= 0 + y_loc_n + disy_3 && lcd_y <= 3 + y_loc_n + disy_3 ) 
					   || (lcd_x >= 9 + x_loc_n + disx_3 && lcd_x <= 12 + x_loc_n + disx_3 && lcd_y >= 3 + y_loc_n + disy_3 && lcd_y <= 6 + y_loc_n + disy_3 )
					   || (lcd_x >= 6 + x_loc_n + disx_3 && lcd_x <= 9 + x_loc_n + disx_3 && lcd_y >= 6 + y_loc_n + disy_3 && lcd_y <= 9 + y_loc_n + disy_3 ) 
					   || (lcd_x >= 9 + x_loc_n + disx_3 && lcd_x <= 12 + x_loc_n + disx_3 && lcd_y >= 9 + y_loc_n + disy_3 && lcd_y <= 12 + y_loc_n + disy_3 ) 
					   || (lcd_x >= 12 + x_loc_n + disx_3 && lcd_x <= 15 + x_loc_n + disx_3 && lcd_y >= 12 + y_loc_n + disy_3 && lcd_y <= 18 + y_loc_n + disy_3 ) 
					   || (lcd_x >= 3 + x_loc_n + disx_3 && lcd_x <= 12 + x_loc_n + disx_3 && lcd_y >= 18 + y_loc_n + disy_3 && lcd_y <= 21 + y_loc_n + disy_3 ) 
					   || (lcd_x >= 0 + x_loc_n + disx_3 && lcd_x <= 3 + x_loc_n + disx_3 && lcd_y >= 15 + y_loc_n + disy_3 && lcd_y <= 18 + y_loc_n + disy_3 ) )begin
					   lcd_scoreboard <= `GREEN;
					end
					else
					   lcd_scoreboard <= 0;
				end
				
				else if (ten == 4) begin
					disx_4 <= 0;
					disy_4 <= 0;
					if( (lcd_x >= 0 + x_loc_n + disx_4 && lcd_x <= 3 + x_loc_n + disx_4 && lcd_y >= 9 + y_loc_n + disy_4 && lcd_y <= 15 + y_loc_n + disy_4 ) 
					   || (lcd_x >= 3 + x_loc_n + disx_4 && lcd_x <= 6 + x_loc_n + disx_4 && lcd_y >= 6 + y_loc_n + disy_4 && lcd_y <= 9 + y_loc_n + disy_4 )
					   || (lcd_x >= 6 + x_loc_n + disx_4 && lcd_x <= 9 + x_loc_n + disx_4 && lcd_y >= 3 + y_loc_n + disy_4 && lcd_y <= 6 + y_loc_n + disy_4 ) 
					   || (lcd_x >= 9 + x_loc_n + disx_4 && lcd_x <= 12 + x_loc_n + disx_4 && lcd_y >= 0 + y_loc_n + disy_4 && lcd_y <= 21 + y_loc_n + disy_4 ) 
					   || (lcd_x >= 0 + x_loc_n + disx_4 && lcd_x <= 15 + x_loc_n + disx_4 && lcd_y >= 12 + y_loc_n + disy_4 && lcd_y <= 15 + y_loc_n + disy_4 ))begin
					   lcd_scoreboard <= `GREEN;
					end
					else
					   lcd_scoreboard <= 0;
				end
				
				else if (ten == 5) begin
					disx_5 <= 0;
					disy_5 <= 0;
					if( (lcd_x >= 0 + x_loc_n + disx_5 && lcd_x <= 15 + x_loc_n + disx_5 && lcd_y >= 0 + y_loc_n + disy_5 && lcd_y <= 3 + y_loc_n + disy_5 ) 
					   || (lcd_x >= 0 + x_loc_n + disx_5 && lcd_x <= 3 + x_loc_n + disx_5 && lcd_y >= 3 + y_loc_n + disy_5 && lcd_y <= 6 + y_loc_n + disy_5 )
					   || (lcd_x >= 0 + x_loc_n + disx_5 && lcd_x <= 12 + x_loc_n + disx_5 && lcd_y >= 6 + y_loc_n + disy_5 && lcd_y <= 9 + y_loc_n + disy_5 ) 
					   || (lcd_x >= 12 + x_loc_n + disx_5 && lcd_x <= 15 + x_loc_n + disx_5 && lcd_y >= 9 + y_loc_n + disy_5 && lcd_y <= 18 + y_loc_n + disy_5 ) 
					   || (lcd_x >= 3 + x_loc_n + disx_5 && lcd_x <= 12 + x_loc_n + disx_5 && lcd_y >= 18 + y_loc_n + disy_5 && lcd_y <= 21 + y_loc_n + disy_5 ) 
					   || (lcd_x >= 0 + x_loc_n + disx_5 && lcd_x <= 3 + x_loc_n + disx_5 && lcd_y >= 15 + y_loc_n + disy_5 && lcd_y <= 18 + y_loc_n + disy_5 ))begin
					   lcd_scoreboard <= `GREEN;
					end
					else
					   lcd_scoreboard <= 0;
				end
				
				else if (ten == 6) begin
					disx_6 <= 0;
					disy_6 <= 0;
					if( (lcd_x >= 6 + x_loc_n + disx_6 && lcd_x <= 12 + x_loc_n + disx_6 && lcd_y >= 0 + y_loc_n + disy_6 && lcd_y <= 3 + y_loc_n + disy_6 ) 
					   || (lcd_x >= 3 + x_loc_n + disx_6 && lcd_x <= 6 + x_loc_n + disx_6 && lcd_y >= 3 + y_loc_n + disy_6 && lcd_y <= 6 + y_loc_n + disy_6 )
					   || (lcd_x >= 0 + x_loc_n + disx_6 && lcd_x <= 3 + x_loc_n + disx_6 && lcd_y >= 6 + y_loc_n + disy_6 && lcd_y <= 18 + y_loc_n + disy_6 ) 
					   || (lcd_x >= 0 + x_loc_n + disx_6 && lcd_x <= 12 + x_loc_n + disx_6 && lcd_y >= 9 + y_loc_n + disy_6 && lcd_y <= 12 + y_loc_n + disy_6 ) 
					   || (lcd_x >= 12 + x_loc_n + disx_6 && lcd_x <= 15 + x_loc_n + disx_6 && lcd_y >= 12 + y_loc_n + disy_6 && lcd_y <= 18 + y_loc_n + disy_6 )
					   || (lcd_x >= 3 + x_loc_n + disx_6 && lcd_x <= 12 + x_loc_n + disx_6 && lcd_y >= 18 + y_loc_n + disy_6 && lcd_y <= 21 + y_loc_n + disy_6 ) )begin
					   lcd_scoreboard <= `GREEN;
					end
					else
					   lcd_scoreboard <= 0;
				end
				
				else if (ten == 7) begin
					disx_7 <= 0;
					disy_7 <= 0;
					if( (lcd_x >= 0 + x_loc_n + disx_7 && lcd_x <= 15 + x_loc_n + disx_7 && lcd_y >= 0 + y_loc_n + disy_7 && lcd_y <= 3 + y_loc_n + disy_7 ) 
					   || (lcd_x >= 12 + x_loc_n + disx_7 && lcd_x <= 15 + x_loc_n + disx_7 && lcd_y >= 3 + y_loc_n + disy_7 && lcd_y <= 6 + y_loc_n + disy_7 )
					   || (lcd_x >= 9 + x_loc_n + disx_7 && lcd_x <= 12 + x_loc_n + disx_7 && lcd_y >= 6 + y_loc_n + disy_7 && lcd_y <= 9 + y_loc_n + disy_7 ) 
					   || (lcd_x >= 6 + x_loc_n + disx_7 && lcd_x <= 9 + x_loc_n + disx_7 && lcd_y >= 9 + y_loc_n + disy_7 && lcd_y <= 12 + y_loc_n + disy_7 ) 
					   || (lcd_x >= 3 + x_loc_n + disx_7 && lcd_x <= 6 + x_loc_n + disx_7 && lcd_y >= 12 + y_loc_n + disy_7 && lcd_y <= 21 + y_loc_n + disy_7 ) )begin
					   lcd_scoreboard <= `GREEN;
					end
					else
					   lcd_scoreboard <= 0;
				end
				
				else if (ten == 8) begin
					disx_8 <= 0;
					disy_8 <= 0;
					if( (lcd_x >= 3 + x_loc_n + disx_8 && lcd_x <= 12 + x_loc_n + disx_8 && lcd_y >= 0 + y_loc_n + disy_8 && lcd_y <= 3 + y_loc_n + disy_8 ) 
					   || (lcd_x >= 3 + x_loc_n + disx_8 && lcd_x <= 12 + x_loc_n + disx_8 && lcd_y >= 9 + y_loc_n + disy_8 && lcd_y <= 12 + y_loc_n + disy_8 )
					   || (lcd_x >= 3 + x_loc_n + disx_8 && lcd_x <= 12 + x_loc_n + disx_8 && lcd_y >= 18 + y_loc_n + disy_8 && lcd_y <= 21 + y_loc_n + disy_8 ) 
					   || (lcd_x >= 0 + x_loc_n + disx_8 && lcd_x <= 3 + x_loc_n + disx_8 && lcd_y >= 3 + y_loc_n + disy_8 && lcd_y <= 9 + y_loc_n + disy_8 ) 
					   || (lcd_x >= 0 + x_loc_n + disx_8 && lcd_x <= 3 + x_loc_n + disx_8 && lcd_y >= 12 + y_loc_n + disy_8 && lcd_y <= 18 + y_loc_n + disy_8 ) 
					   || (lcd_x >= 12 + x_loc_n + disx_8 && lcd_x <= 15 + x_loc_n + disx_8 && lcd_y >= 3 + y_loc_n + disy_8 && lcd_y <= 9 + y_loc_n + disy_8 ) 
					   || (lcd_x >= 12 + x_loc_n + disx_8 && lcd_x <= 15 + x_loc_n + disx_8 && lcd_y >= 12 + y_loc_n + disy_8 && lcd_y <= 18 + y_loc_n + disy_8 ))begin
					   lcd_scoreboard <= `GREEN;
					end
					else
					   lcd_scoreboard <= 0;
				end
				
				else if (ten == 9) begin
					disx_9 <= 0;
					disy_9 <= 0;
					if( (lcd_x >= 3 + x_loc_n + disx_9 && lcd_x <= 12 + x_loc_n + disx_9 && lcd_y >= 0 + y_loc_n + disy_9 && lcd_y <= 3 + y_loc_n + disy_9 ) 
					   || (lcd_x >= 3 + x_loc_n + disx_9 && lcd_x <= 12 + x_loc_n + disx_9 && lcd_y >= 9 + y_loc_n + disy_9 && lcd_y <= 12 + y_loc_n + disy_9 )
					   || (lcd_x >= 3 + x_loc_n + disx_9 && lcd_x <= 9 + x_loc_n + disx_9 && lcd_y >= 18 + y_loc_n + disy_9 && lcd_y <= 21 + y_loc_n + disy_9 ) 
					   || (lcd_x >= 0 + x_loc_n + disx_9 && lcd_x <= 3 + x_loc_n + disx_9 && lcd_y >= 3 + y_loc_n + disy_9 && lcd_y <= 9 + y_loc_n + disy_9 ) 
					   || (lcd_x >= 12 + x_loc_n + disx_9 && lcd_x <= 15 + x_loc_n + disx_9 && lcd_y >= 3 + y_loc_n + disy_9 && lcd_y <= 15 + y_loc_n + disy_9 ) 
					   || (lcd_x >= 9 + x_loc_n + disx_9 && lcd_x <= 12 + x_loc_n + disx_9 && lcd_y >= 15 + y_loc_n + disy_9 && lcd_y <= 18 + y_loc_n + disy_9 ))begin
					   lcd_scoreboard <= `GREEN;
					end
					else
					   lcd_scoreboard <= 0;
				end
					
			end
        
			else if (lcd_x >= 517 && lcd_x <= 535) begin
			

				if (one == 0) begin
					disx_0 <= 18;
					disy_0 <= 0;
					
					if( (lcd_x >= 3 + x_loc_n + disx_0 && lcd_x <= 12 + x_loc_n + disx_0 && lcd_y >= 0 + y_loc_n + disy_0 && lcd_y <= 3 + y_loc_n + disy_0 )
					   || (lcd_x >= 3 + x_loc_n + disx_0 && lcd_x <= 12 + x_loc_n + disx_0 && lcd_y >= 18 + y_loc_n + disy_0 && lcd_y <= 21 + y_loc_n + disy_0 ) 
					   || (lcd_x >= 0 + x_loc_n + disx_0 && lcd_x <= 3 + x_loc_n + disx_0 && lcd_y >= 3 + y_loc_n + disy_0 && lcd_y <= 18 + y_loc_n + disy_0 ) 
					   || (lcd_x >= 12 + x_loc_n + disx_0 && lcd_x <= 15 + x_loc_n + disx_0 && lcd_y >= 3 + y_loc_n + disy_0 && lcd_y <= 18 + y_loc_n + disy_0 ) 
					   || (lcd_x >= 9 + x_loc_n + disx_0 && lcd_x <= 12 + x_loc_n + disx_0 && lcd_y >= 6 + y_loc_n + disy_0 && lcd_y <= 9 + y_loc_n + disy_0 ) 
					   || (lcd_x >= 6 + x_loc_n + disx_0 && lcd_x <= 9 + x_loc_n + disx_0 && lcd_y >= 9 + y_loc_n + disy_0 && lcd_y <= 12 + y_loc_n + disy_0 )
					   || (lcd_x >= 3 + x_loc_n + disx_0 && lcd_x <= 6 + x_loc_n + disx_0 && lcd_y >= 12 + y_loc_n + disy_0 && lcd_y <= 15 + y_loc_n + disy_0 ) )begin
					   lcd_scoreboard <= `GREEN;
					end
					else
					   lcd_scoreboard <= 0;
				end
			
				else if (one == 1) begin
				
					disx_1 <= 18;
					disy_1 <= 0;
					if( (lcd_x >= 6 + x_loc_n + disx_1 && lcd_x <= 9 + x_loc_n + disx_1 && lcd_y >= 0 + y_loc_n + disy_1 && lcd_y <= 21 + y_loc_n + disy_1 ) 
					   || (lcd_x >= 3 + x_loc_n + disx_1 && lcd_x <= 9 + x_loc_n + disx_1 && lcd_y >= 3 + y_loc_n + disy_1 && lcd_y <= 6 + y_loc_n + disy_1 )
					   || (lcd_x >= 3 + x_loc_n + disx_1 && lcd_x <= 12 + x_loc_n + disx_1 && lcd_y >= 18 + y_loc_n + disy_1 && lcd_y <= 21 + y_loc_n + disy_1  ) )begin
					   lcd_scoreboard <= `GREEN;
					end
					else
					   lcd_scoreboard <= 0;
				
				end
			
				else if (one == 2) begin
					disx_2 <= 18;
					disy_2 <= 0;
					if( (lcd_x >= 0 + x_loc_n + disx_2 && lcd_x <= 3 + x_loc_n + disx_2 && lcd_y >= 3 + y_loc_n + disy_2 && lcd_y <= 6 + y_loc_n + disy_2 ) 
					   || (lcd_x >= 3 + x_loc_n + disx_2 && lcd_x <= 12 + x_loc_n + disx_2 && lcd_y >= 0 + y_loc_n + disy_2 && lcd_y <= 3 + y_loc_n + disy_2 )
					   || (lcd_x >= 12 + x_loc_n + disx_2 && lcd_x <= 15 + x_loc_n + disx_2 && lcd_y >= 3 + y_loc_n + disy_2 && lcd_y <= 9 + y_loc_n + disy_2 ) 
					   || (lcd_x >= 9 + x_loc_n + disx_2 && lcd_x <= 12 + x_loc_n + disx_2 && lcd_y >= 9 + y_loc_n + disy_2 && lcd_y <= 12 + y_loc_n + disy_2 ) 
					   || (lcd_x >= 6 + x_loc_n + disx_2 && lcd_x <= 9 + x_loc_n + disx_2 && lcd_y >= 12 + y_loc_n + disy_2 && lcd_y <= 15 + y_loc_n + disy_2 ) 
					   || (lcd_x >= 3 + x_loc_n + disx_2 && lcd_x <= 6 + x_loc_n + disx_2 && lcd_y >= 15 + y_loc_n + disy_2 && lcd_y <= 18 + y_loc_n + disy_2 ) 
					   || (lcd_x >= 0 + x_loc_n + disx_2 && lcd_x <= 15 + x_loc_n + disx_2 && lcd_y >= 18 + y_loc_n + disy_2 && lcd_y <= 21 + y_loc_n + disy_2 ) )begin
					   lcd_scoreboard <= `GREEN;
					end
					else
					   lcd_scoreboard <= 0;
				end
			
				else if (one == 3) begin
					disx_3 <= 18;
					disy_3 <= 0;
					if( (lcd_x >= 0 + x_loc_n + disx_3 && lcd_x <= 15 + x_loc_n + disx_3 && lcd_y >= 0 + y_loc_n + disy_3 && lcd_y <= 3 + y_loc_n + disy_3 ) 
					   || (lcd_x >= 9 + x_loc_n + disx_3 && lcd_x <= 12 + x_loc_n + disx_3 && lcd_y >= 3 + y_loc_n + disy_3 && lcd_y <= 6 + y_loc_n + disy_3 )
					   || (lcd_x >= 6 + x_loc_n + disx_3 && lcd_x <= 9 + x_loc_n + disx_3 && lcd_y >= 6 + y_loc_n + disy_3 && lcd_y <= 9 + y_loc_n + disy_3 ) 
					   || (lcd_x >= 9 + x_loc_n + disx_3 && lcd_x <= 12 + x_loc_n + disx_3 && lcd_y >= 9 + y_loc_n + disy_3 && lcd_y <= 12 + y_loc_n + disy_3 ) 
					   || (lcd_x >= 12 + x_loc_n + disx_3 && lcd_x <= 15 + x_loc_n + disx_3 && lcd_y >= 12 + y_loc_n + disy_3 && lcd_y <= 18 + y_loc_n + disy_3 ) 
					   || (lcd_x >= 3 + x_loc_n + disx_3 && lcd_x <= 12 + x_loc_n + disx_3 && lcd_y >= 18 + y_loc_n + disy_3 && lcd_y <= 21 + y_loc_n + disy_3 ) 
					   || (lcd_x >= 0 + x_loc_n + disx_3 && lcd_x <= 3 + x_loc_n + disx_3 && lcd_y >= 15 + y_loc_n + disy_3 && lcd_y <= 18 + y_loc_n + disy_3 ) )begin
					   lcd_scoreboard <= `GREEN;
					end
					else
					   lcd_scoreboard <= 0;
				end
			
				else if (one == 4) begin
					disx_4 <= 18;
					disy_4 <= 0;
					if( (lcd_x >= 0 + x_loc_n + disx_4 && lcd_x <= 3 + x_loc_n + disx_4 && lcd_y >= 9 + y_loc_n + disy_4 && lcd_y <= 15 + y_loc_n + disy_4 ) 
					   || (lcd_x >= 3 + x_loc_n + disx_4 && lcd_x <= 6 + x_loc_n + disx_4 && lcd_y >= 6 + y_loc_n + disy_4 && lcd_y <= 9 + y_loc_n + disy_4 )
					   || (lcd_x >= 6 + x_loc_n + disx_4 && lcd_x <= 9 + x_loc_n + disx_4 && lcd_y >= 3 + y_loc_n + disy_4 && lcd_y <= 6 + y_loc_n + disy_4 ) 
					   || (lcd_x >= 9 + x_loc_n + disx_4 && lcd_x <= 12 + x_loc_n + disx_4 && lcd_y >= 0 + y_loc_n + disy_4 && lcd_y <= 21 + y_loc_n + disy_4 ) 
					   || (lcd_x >= 0 + x_loc_n + disx_4 && lcd_x <= 15 + x_loc_n + disx_4 && lcd_y >= 12 + y_loc_n + disy_4 && lcd_y <= 15 + y_loc_n + disy_4 ))begin
					   lcd_scoreboard <= `GREEN;
					end
					else
					   lcd_scoreboard <= 0;
				end
			
				else if (one == 5) begin
					disx_5 <= 18;
					disy_5 <= 0;
					if( (lcd_x >= 0 + x_loc_n + disx_5 && lcd_x <= 15 + x_loc_n + disx_5 && lcd_y >= 0 + y_loc_n + disy_5 && lcd_y <= 3 + y_loc_n + disy_5 ) 
					   || (lcd_x >= 0 + x_loc_n + disx_5 && lcd_x <= 3 + x_loc_n + disx_5 && lcd_y >= 3 + y_loc_n + disy_5 && lcd_y <= 6 + y_loc_n + disy_5 )
					   || (lcd_x >= 0 + x_loc_n + disx_5 && lcd_x <= 12 + x_loc_n + disx_5 && lcd_y >= 6 + y_loc_n + disy_5 && lcd_y <= 9 + y_loc_n + disy_5 ) 
					   || (lcd_x >= 12 + x_loc_n + disx_5 && lcd_x <= 15 + x_loc_n + disx_5 && lcd_y >= 9 + y_loc_n + disy_5 && lcd_y <= 18 + y_loc_n + disy_5 ) 
					   || (lcd_x >= 3 + x_loc_n + disx_5 && lcd_x <= 12 + x_loc_n + disx_5 && lcd_y >= 18 + y_loc_n + disy_5 && lcd_y <= 21 + y_loc_n + disy_5 ) 
					   || (lcd_x >= 0 + x_loc_n + disx_5 && lcd_x <= 3 + x_loc_n + disx_5 && lcd_y >= 15 + y_loc_n + disy_5 && lcd_y <= 18 + y_loc_n + disy_5 ))begin
					   lcd_scoreboard <= `GREEN;
					end
					else
					   lcd_scoreboard <= 0;
				end
			
				else if (one == 6) begin
					disx_6 <= 18;
					disy_6 <= 0;
					if( (lcd_x >= 6 + x_loc_n + disx_6 && lcd_x <= 12 + x_loc_n + disx_6 && lcd_y >= 0 + y_loc_n + disy_6 && lcd_y <= 3 + y_loc_n + disy_6 ) 
					   || (lcd_x >= 3 + x_loc_n + disx_6 && lcd_x <= 6 + x_loc_n + disx_6 && lcd_y >= 3 + y_loc_n + disy_6 && lcd_y <= 6 + y_loc_n + disy_6 )
					   || (lcd_x >= 0 + x_loc_n + disx_6 && lcd_x <= 3 + x_loc_n + disx_6 && lcd_y >= 6 + y_loc_n + disy_6 && lcd_y <= 18 + y_loc_n + disy_6 ) 
					   || (lcd_x >= 0 + x_loc_n + disx_6 && lcd_x <= 12 + x_loc_n + disx_6 && lcd_y >= 9 + y_loc_n + disy_6 && lcd_y <= 12 + y_loc_n + disy_6 ) 
					   || (lcd_x >= 12 + x_loc_n + disx_6 && lcd_x <= 15 + x_loc_n + disx_6 && lcd_y >= 12 + y_loc_n + disy_6 && lcd_y <= 18 + y_loc_n + disy_6 )
					   || (lcd_x >= 3 + x_loc_n + disx_6 && lcd_x <= 12 + x_loc_n + disx_6 && lcd_y >= 18 + y_loc_n + disy_6 && lcd_y <= 21 + y_loc_n + disy_6 ) )begin
					   lcd_scoreboard <= `GREEN;
					end
					else
					   lcd_scoreboard <= 0;
				end
			
				else if (one == 7) begin
					disx_7 <= 18;
					disy_7 <= 0;
					if( (lcd_x >= 0 + x_loc_n + disx_7 && lcd_x <= 15 + x_loc_n + disx_7 && lcd_y >= 0 + y_loc_n + disy_7 && lcd_y <= 3 + y_loc_n + disy_7 ) 
					   || (lcd_x >= 12 + x_loc_n + disx_7 && lcd_x <= 15 + x_loc_n + disx_7 && lcd_y >= 3 + y_loc_n + disy_7 && lcd_y <= 6 + y_loc_n + disy_7 )
					   || (lcd_x >= 9 + x_loc_n + disx_7 && lcd_x <= 12 + x_loc_n + disx_7 && lcd_y >= 6 + y_loc_n + disy_7 && lcd_y <= 9 + y_loc_n + disy_7 ) 
					   || (lcd_x >= 6 + x_loc_n + disx_7 && lcd_x <= 9 + x_loc_n + disx_7 && lcd_y >= 9 + y_loc_n + disy_7 && lcd_y <= 12 + y_loc_n + disy_7 ) 
					   || (lcd_x >= 3 + x_loc_n + disx_7 && lcd_x <= 6 + x_loc_n + disx_7 && lcd_y >= 12 + y_loc_n + disy_7 && lcd_y <= 21 + y_loc_n + disy_7 ) )begin
					   lcd_scoreboard <= `GREEN;
					end
					else
					   lcd_scoreboard <= 0;
				end
			
				else if (one == 8) begin
					disx_8 <= 18;
					disy_8 <= 0;
					if( (lcd_x >= 3 + x_loc_n + disx_8 && lcd_x <= 12 + x_loc_n + disx_8 && lcd_y >= 0 + y_loc_n + disy_8 && lcd_y <= 3 + y_loc_n + disy_8 ) 
					   || (lcd_x >= 3 + x_loc_n + disx_8 && lcd_x <= 12 + x_loc_n + disx_8 && lcd_y >= 9 + y_loc_n + disy_8 && lcd_y <= 12 + y_loc_n + disy_8 )
					   || (lcd_x >= 3 + x_loc_n + disx_8 && lcd_x <= 12 + x_loc_n + disx_8 && lcd_y >= 18 + y_loc_n + disy_8 && lcd_y <= 21 + y_loc_n + disy_8 ) 
					   || (lcd_x >= 0 + x_loc_n + disx_8 && lcd_x <= 3 + x_loc_n + disx_8 && lcd_y >= 3 + y_loc_n + disy_8 && lcd_y <= 9 + y_loc_n + disy_8 ) 
					   || (lcd_x >= 0 + x_loc_n + disx_8 && lcd_x <= 3 + x_loc_n + disx_8 && lcd_y >= 12 + y_loc_n + disy_8 && lcd_y <= 18 + y_loc_n + disy_8 ) 
					   || (lcd_x >= 12 + x_loc_n + disx_8 && lcd_x <= 15 + x_loc_n + disx_8 && lcd_y >= 3 + y_loc_n + disy_8 && lcd_y <= 9 + y_loc_n + disy_8 ) 
					   || (lcd_x >= 12 + x_loc_n + disx_8 && lcd_x <= 15 + x_loc_n + disx_8 && lcd_y >= 12 + y_loc_n + disy_8 && lcd_y <= 18 + y_loc_n + disy_8 ))begin
					   lcd_scoreboard <= `GREEN;
					end
					else
					   lcd_scoreboard <= 0;
				end
			
				else if (one == 9) begin
					disx_9 <= 18;
					disy_9 <= 0;
					if( (lcd_x >= 3 + x_loc_n + disx_9 && lcd_x <= 12 + x_loc_n + disx_9 && lcd_y >= 0 + y_loc_n + disy_9 && lcd_y <= 3 + y_loc_n + disy_9 ) 
					   || (lcd_x >= 3 + x_loc_n + disx_9 && lcd_x <= 12 + x_loc_n + disx_9 && lcd_y >= 9 + y_loc_n + disy_9 && lcd_y <= 12 + y_loc_n + disy_9 )
					   || (lcd_x >= 3 + x_loc_n + disx_9 && lcd_x <= 9 + x_loc_n + disx_9 && lcd_y >= 18 + y_loc_n + disy_9 && lcd_y <= 21 + y_loc_n + disy_9 ) 
					   || (lcd_x >= 0 + x_loc_n + disx_9 && lcd_x <= 3 + x_loc_n + disx_9 && lcd_y >= 3 + y_loc_n + disy_9 && lcd_y <= 9 + y_loc_n + disy_9 ) 
					   || (lcd_x >= 12 + x_loc_n + disx_9 && lcd_x <= 15 + x_loc_n + disx_9 && lcd_y >= 3 + y_loc_n + disy_9 && lcd_y <= 15 + y_loc_n + disy_9 ) 
					   || (lcd_x >= 9 + x_loc_n + disx_9 && lcd_x <= 12 + x_loc_n + disx_9 && lcd_y >= 15 + y_loc_n + disy_9 && lcd_y <= 18 + y_loc_n + disy_9 ))begin
					   lcd_scoreboard <= `GREEN;
					end
					else
					   lcd_scoreboard <= 0;
				end
			
			end

		end
		
		else if (sw1 == 0)begin
			x_loc <= 520;
			y_loc <= 300;
			
			disx_s <= 0;
			disy_s <= 0;
			
			disx_c <= 18;
			disy_c <= 0;
			
			disx_o <= 36;
			disy_o <= 0;
			
			disx_r <= 54;
			disy_r <= 0;
			
			disx_e <= 72;
			disy_e <= 0;
			
			disx_b <= 90;
			disy_b <= 0;
			
			disx_o2 <= 108;
			disy_o2 <= 0;
			
			disx_a <= 126;
			disy_a <= 0;
			
			disx_r2 <= 144;
			disy_r2 <= 0;
			
			disx_d <= 162;
			disy_d <= 0;
			
			//frame
			if(lcd_y == 280 && lcd_x >= 440 && lcd_x <= 780
				|| lcd_y == 510 && lcd_x >= 440 && lcd_x <= 780
				|| lcd_x == 440 && lcd_y >= 280 && lcd_y <= 510
				|| lcd_x == 780 && lcd_y >= 280 && lcd_y <= 510)begin
				lcd_scoreboard <= `GREEN;
			end
			
			//S
		   else if( (lcd_x >= 3 + x_loc + disx_s && lcd_x <= 15 + x_loc + disx_s && lcd_y >= 0 + y_loc + disy_s && lcd_y <= 3 + y_loc + disy_s ) 
			    || (lcd_x >= 0 + x_loc + disx_s && lcd_x <= 3 + x_loc + disx_s && lcd_y >= 3 + y_loc + disy_s && lcd_y <= 9 + y_loc + disy_s )
			    || (lcd_x >= 3 + x_loc + disx_s && lcd_x <= 12 + x_loc + disx_s && lcd_y >= 9 + y_loc + disy_s && lcd_y <= 12 + y_loc + disy_s  )
			    || (lcd_x >= 12 + x_loc + disx_s && lcd_x <= 15 + x_loc + disx_s && lcd_y >= 12 + y_loc + disy_s && lcd_y <= 18 + y_loc + disy_s  )
			    || (lcd_x >= 0 + x_loc + disx_s && lcd_x <= 12 + x_loc + disx_s && lcd_y >= 18 + y_loc + disy_s && lcd_y <= 21 + y_loc + disy_s ) )begin
			    lcd_scoreboard <= `GREEN;
		    end
			
			// C
		    else if( (lcd_x >= 3 + x_loc + disx_c && lcd_x <= 12 + x_loc + disx_c && lcd_y >= 0 + y_loc + disy_c && lcd_y <= 3 + y_loc + disy_c ) 
				|| (lcd_x >= 0 + x_loc + disx_c && lcd_x <= 3 + x_loc + disx_c && lcd_y >= 3 + y_loc + disy_c && lcd_y <= 18 + y_loc + disy_c )
				|| (lcd_x >= 3 + x_loc + disx_c && lcd_x <= 12 + x_loc + disx_c && lcd_y >= 18 + y_loc + disy_c && lcd_y <= 21 + y_loc + disy_c  )
				|| (lcd_x >= 12 + x_loc + disx_c && lcd_x <= 15 + x_loc + disx_c && lcd_y >= 3 + y_loc + disy_c && lcd_y <= 6 + y_loc + disy_c  )
				|| (lcd_x >= 12 + x_loc + disx_c && lcd_x <= 15 + x_loc + disx_c && lcd_y >= 15 + y_loc + disy_c && lcd_y <= 18 + y_loc + disy_c ) )begin
				lcd_scoreboard <= `GREEN;
			end
	
			// O
		    else if( (lcd_x >= 3 + x_loc + disx_o && lcd_x <= 12 + x_loc + disx_o && lcd_y >= 0 + y_loc + disy_o && lcd_y <= 3 + y_loc + disy_o ) 
			    || (lcd_x >= 0 + x_loc + disx_o && lcd_x <= 3 + x_loc + disx_o && lcd_y >= 3 + y_loc + disy_o && lcd_y <= 18 + y_loc + disy_o )
			    || (lcd_x >= 12 + x_loc + disx_o && lcd_x <= 15 + x_loc + disx_o && lcd_y >= 3 + y_loc + disy_o && lcd_y <= 18 + y_loc + disy_o  )
			    || (lcd_x >= 3 + x_loc + disx_o && lcd_x <= 12 + x_loc + disx_o && lcd_y >= 18 + y_loc + disy_o && lcd_y <= 21 + y_loc + disy_o ) )begin
			    lcd_scoreboard <= `GREEN;
		    end
			
			//R
			else if( (lcd_x >= 0 + x_loc + disx_r && lcd_x <= 12 + x_loc + disx_r && lcd_y >= 0 + y_loc + disy_r && lcd_y <= 3 + y_loc + disy_r ) 
				|| (lcd_x >= 12 + x_loc + disx_r && lcd_x <= 15 + x_loc + disx_r && lcd_y >= 3 + y_loc + disy_r && lcd_y <= 9 + y_loc + disy_r )
				|| (lcd_x >= 0 + x_loc + disx_r && lcd_x <= 12 + x_loc + disx_r && lcd_y >= 9 + y_loc + disy_r && lcd_y <= 12 + y_loc + disy_r  )
				|| (lcd_x >= 0 + x_loc + disx_r && lcd_x <= 3 + x_loc + disx_r && lcd_y >= 0 + y_loc + disy_r && lcd_y <= 21 + y_loc + disy_r  )
				|| (lcd_x >= 6 + x_loc + disx_r && lcd_x <= 9 + x_loc + disx_r && lcd_y >= 12 + y_loc + disy_r && lcd_y <= 15 + y_loc + disy_r )
				|| (lcd_x >= 9 + x_loc + disx_r && lcd_x <= 12 + x_loc + disx_r && lcd_y >= 15 + y_loc + disy_r && lcd_y <= 18 + y_loc + disy_r )
				|| (lcd_x >= 12 + x_loc + disx_r && lcd_x <= 15 + x_loc + disx_r && lcd_y >= 18 + y_loc + disy_r && lcd_y <= 21 + y_loc + disy_r ) )begin
				lcd_scoreboard <= `GREEN;
			end
			
			// E
			else if( (lcd_x >= 0 + x_loc + disx_e && lcd_x <= 15 + x_loc + disx_e && lcd_y >= 0 + y_loc + disy_e && lcd_y <= 3 + y_loc + disy_e ) 
				|| (lcd_x >= 0 + x_loc + disx_e && lcd_x <= 3 + x_loc + disx_e && lcd_y >= 0 + y_loc + disy_e && lcd_y <= 21 + y_loc + disy_e )
				|| (lcd_x >= 0 + x_loc + disx_e && lcd_x <= 12 + x_loc + disx_e && lcd_y >= 9 + y_loc + disy_e && lcd_y <= 12 + y_loc + disy_e  )
				|| (lcd_x >= 0 + x_loc + disx_e && lcd_x <= 15 + x_loc + disx_e && lcd_y >= 18 + y_loc + disy_e && lcd_y <= 21 + y_loc + disy_e ) )begin
				lcd_scoreboard <= `GREEN;
			end
			
			//B
			else if( (lcd_x >= 0 + x_loc + disx_b && lcd_x <= 12 + x_loc + disx_b && lcd_y >= 0 + y_loc + disy_b && lcd_y <= 3 + y_loc + disy_b ) 
				|| (lcd_x >= 0 + x_loc + disx_b && lcd_x <= 3 + x_loc + disx_b && lcd_y >= 0 + y_loc + disy_b && lcd_y <= 21 + y_loc + disy_b )
				|| (lcd_x >= 12 + x_loc + disx_b && lcd_x <= 15 + x_loc + disx_b && lcd_y >= 3 + y_loc + disy_b && lcd_y <= 9 + y_loc + disy_b  )
				|| (lcd_x >= 0 + x_loc + disx_b && lcd_x <= 12 + x_loc + disx_b && lcd_y >= 9 + y_loc + disy_b && lcd_y <= 12 + y_loc + disy_b )
				|| (lcd_x >= 12 + x_loc + disx_b && lcd_x <= 15 + x_loc + disx_b && lcd_y >= 12 + y_loc + disy_b && lcd_y <= 18 + y_loc + disy_b ) 
				|| (lcd_x >= 0 + x_loc + disx_b && lcd_x <= 12 + x_loc + disx_b && lcd_y >= 18 + y_loc + disy_b && lcd_y <= 21 + y_loc + disy_b )  )begin
				lcd_scoreboard <= `GREEN;
			end
			
			// O2
		    else if( (lcd_x >= 3 + x_loc + disx_o2 && lcd_x <= 12 + x_loc + disx_o2 && lcd_y >= 0 + y_loc + disy_o2 && lcd_y <= 3 + y_loc + disy_o2 ) 
			    || (lcd_x >= 0 + x_loc + disx_o2 && lcd_x <= 3 + x_loc + disx_o2 && lcd_y >= 3 + y_loc + disy_o2 && lcd_y <= 18 + y_loc + disy_o2 )
			    || (lcd_x >= 12 + x_loc + disx_o2 && lcd_x <= 15 + x_loc + disx_o2 && lcd_y >= 3 + y_loc + disy_o2 && lcd_y <= 18 + y_loc + disy_o2  )
			    || (lcd_x >= 3 + x_loc + disx_o2 && lcd_x <= 12 + x_loc + disx_o2 && lcd_y >= 18 + y_loc + disy_o2 && lcd_y <= 21 + y_loc + disy_o2 ) )begin
			    lcd_scoreboard <= `GREEN;
		    end
			
			// A
			else if( (lcd_x >= 3 + x_loc + disx_a && lcd_x <= 12 + x_loc + disx_a && lcd_y >= 0 + y_loc + disy_a && lcd_y <= 3 + y_loc + disy_a ) 
				|| (lcd_x >= 0 + x_loc + disx_a && lcd_x <= 3 + x_loc + disx_a && lcd_y >= 3 + y_loc + disy_a && lcd_y <= 21 + y_loc + disy_a )
				|| (lcd_x >= 12 + x_loc + disx_a && lcd_x <= 15 + x_loc + disx_a && lcd_y >= 3 + y_loc + disy_a && lcd_y <= 21 + y_loc + disy_a )
				|| (lcd_x >= 0 + x_loc + disx_a && lcd_x <= 15 + x_loc + disx_a && lcd_y >= 9 + y_loc + disy_a && lcd_y <= 12 + y_loc + disy_a ) )begin
				lcd_scoreboard <= `GREEN;
			end
			
			//R2
			else if( (lcd_x >= 0 + x_loc + disx_r2 && lcd_x <= 12 + x_loc + disx_r2 && lcd_y >= 0 + y_loc + disy_r2 && lcd_y <= 3 + y_loc + disy_r2 ) 
				|| (lcd_x >= 12 + x_loc + disx_r2 && lcd_x <= 15 + x_loc + disx_r2 && lcd_y >= 3 + y_loc + disy_r2 && lcd_y <= 9 + y_loc + disy_r2 )
				|| (lcd_x >= 0 + x_loc + disx_r2 && lcd_x <= 12 + x_loc + disx_r2 && lcd_y >= 9 + y_loc + disy_r2 && lcd_y <= 12 + y_loc + disy_r2  )
				|| (lcd_x >= 0 + x_loc + disx_r2 && lcd_x <= 3 + x_loc + disx_r2 && lcd_y >= 0 + y_loc + disy_r2 && lcd_y <= 21 + y_loc + disy_r2  )
				|| (lcd_x >= 6 + x_loc + disx_r2 && lcd_x <= 9 + x_loc + disx_r2 && lcd_y >= 12 + y_loc + disy_r2 && lcd_y <= 15 + y_loc + disy_r2 )
				|| (lcd_x >= 9 + x_loc + disx_r2 && lcd_x <= 12 + x_loc + disx_r2 && lcd_y >= 15 + y_loc + disy_r2 && lcd_y <= 18 + y_loc + disy_r2 )
				|| (lcd_x >= 12 + x_loc + disx_r2 && lcd_x <= 15 + x_loc + disx_r2 && lcd_y >= 18 + y_loc + disy_r2 && lcd_y <= 21 + y_loc + disy_r2 ) )begin
				lcd_scoreboard <= `GREEN;
			end
			
			//D
			else if( (lcd_x >= 0 + x_loc + disx_d && lcd_x <= 12 + x_loc + disx_d && lcd_y >= 0 + y_loc + disy_d && lcd_y <= 3 + y_loc + disy_d ) 
				|| (lcd_x >= 0 + x_loc + disx_d && lcd_x <= 3 + x_loc + disx_d && lcd_y >= 0 + y_loc + disy_d && lcd_y <= 21 + y_loc + disy_d )
				|| (lcd_x >= 12 + x_loc + disx_d && lcd_x <= 15 + x_loc + disx_d && lcd_y >= 3 + y_loc + disy_d && lcd_y <= 18 + y_loc + disy_d  )
				|| (lcd_x >= 0 + x_loc + disx_d && lcd_x <= 12 + x_loc + disx_d && lcd_y >= 18 + y_loc + disy_d && lcd_y <= 21 + y_loc + disy_d ) )begin
				lcd_scoreboard <= `GREEN;
			end
			
			else begin
			     lcd_scoreboard <= 0;
		    end
			
		end
		
		else begin
			lcd_scoreboard <= 0;
		end
	end

endmodule
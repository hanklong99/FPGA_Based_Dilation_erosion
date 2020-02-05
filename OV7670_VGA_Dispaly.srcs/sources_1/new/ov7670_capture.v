`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/05/23 15:11:30
// Design Name: 
// Module Name: ov7725_capture
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


module ov7670_capture(
input pclk,
input vsync,
input href,
input[7:0] d,
input rst_n,
input [9:0] lcd_x,
input [9:0] lcd_y,
output[16:0] addr,
output reg[15:0] post_dout,//modified
//output reg post_clken//modified
output       [11:0]      x_min,
output       [11:0]      x_max,
output       [11:0]      y_min,
output       [11:0]      y_max,
output [15:0] points
    );
    reg [15:0] d_latch;
    reg [15:0] dout;//modified
    wire [15:0] post_dout;//modified
    wire pclk;//modified
    wire rst_n;//modified
    wire post_clken;//modified
    reg [16:0] address;
    reg [16:0] address_next;  
     reg [1:0] wr_hold;    
     reg [1:0] cnt;
     reg we;//modified
  initial d_latch = 16'b0;
   initial address = 19'b0;
   initial address_next = 19'b0;
    initial wr_hold = 2'b0;   
    initial cnt = 2'b0;        
//assign addr =    address;



always@(posedge pclk)begin 
 if( vsync ==1) begin
           address <=17'b0;
           address_next <= 17'b0;
           wr_hold <=  2'b0;
           cnt <=  2'b0;
           end
        else begin
           if(address<76800)
           address <= address_next;
           else
           address <= 76800;
           we      <= wr_hold[1];
           wr_hold <= {wr_hold[0] , (href &&( ! wr_hold[0])) };
           d_latch <= {d_latch[7:0] , d};

           if (wr_hold[1] ==1 )begin
              
              address_next <=address_next+1;
              
             if (d_latch[15:11] >= 5'b10000)
                  dout[15:0] <= 16'b1111_1111_1111_1111;
              else
                  dout [15:0] <= 16'b0;
             //dout[15:0]  <= {d_latch[15:11] , d_latch[10:5] , d_latch[4:0] };
           end
        end
 end
 
reg [16:0] addr_post;
reg [16:0] addr_post_next;
initial addr_post = 19'b0;
initial addr_post_next = 19'b0;
wire post_clken;
wire post_vsync;

always@(posedge pclk)begin 
 if( post_vsync ==1) begin
           addr_post <=17'b0;
           addr_post_next <= 17'b0;
           end
        else begin
           if(addr_post<76800)
           addr_post <= addr_post_next;
           else
           addr_post <= 76800;

           if (post_clken ==1 )begin
              addr_post_next <=addr_post_next+1;
           end
        end
 end

Img_Processor processor(
.lcd_x(lcd_x),
.lcd_y(lcd_y),
.clk (pclk),
.rst_n (rst_n),
.per_clken (we),
.per_data (dout),
.post_data (post_dout),
.ram_addr (),
.post_clken (post_clken),
.vsync (vsync),
.post_vsync(post_vsync),

.x_min(x_min),
.x_max(x_max),
.y_min(y_min),
.y_max(y_max),
.points(points)

);

assign addr = addr_post;

endmodule

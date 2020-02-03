`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/05/23 15:37:54
// Design Name: 
// Module Name: debounce
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


module debounce(
input clk,
input i,
output reg o
    );
 reg[23:0]c;
 initial c = 24'b0;
 
 always@(posedge clk)begin   
   if(i==1)begin
     if(c==24'hFFFFFF)
      o <= 1;
     else
      o <= 0;
     c <= c+1;
    end 
   else begin
     c <= 24'b0;
     o <= 0;
    end
  end  
endmodule

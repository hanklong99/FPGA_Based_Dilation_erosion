`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/08/27 10:55:22
// Design Name: 
// Module Name: Sort
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


module sort(
	input 					   clk,
	input 					   rst_n,
	input	    	[7:0]	   data1,
	input 	    	[7:0]	   data2,
	input 	    	[7:0]	   data3,
	output	reg 	[7:0] 	max_data,
	output	reg 	[7:0] 	mid_data,
	output	reg 	[7:0] 	min_data
);
//--------------------------------------------------
//max
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		max_data <= 8'd0;
	else if(data1 >= data2 && data1 >= data3) 
		max_data <= data1;
	else if(data2 >= data1 && data2 >= data3)
		max_data <= data2;
	else if(data3 >= data1 && data3 >= data2)
		max_data <= data3;
	else 
		max_data <= max_data;
end

//---------------------------------------------------
//mid
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		mid_data <= 8'd0;
	else if((data2 >= data1 && data1 >= data3) || (data3 >= data1 && data1 >= data2))
		mid_data <= data1;
	else if((data1 >= data2 && data2 >= data3) || (data3 >= data2 && data2 >= data1))
		mid_data <= data2;
	else if((data1 >= data3 && data3 >= data2) || (data1 >= data3 && data3 >= data2))
		mid_data <= data3;
	else
		mid_data <= mid_data;
end
	
//----------------------------------------------------
//min
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		min_data <= 8'd0;
	else if(data3 >= data2 && data2 >= data1)
		min_data <= data1;
	else if(data3 >= data1 && data1 >= data2)
		min_data <= data2;
	else if(data1 >= data2 && data2 >= data3)
		min_data <= data3;
	else 
		min_data <= min_data;
end
	
endmodule 

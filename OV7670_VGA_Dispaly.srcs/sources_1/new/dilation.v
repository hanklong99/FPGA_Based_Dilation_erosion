`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/08/30 14:00:54
// Design Name: 
// Module Name: Dilation
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


module dilation(
	input 				clk,
	input 				rst_n,
	input 				per_clken,
	input               per_vsync,
	input 		[7:0]	per_img_bit,
	output 				post_clken,
	output              post_vsync,
	output		[7:0]   post_img_bit

    );
	
//---------------------------------------------------------------------------
//产生3x3阵列
wire 	[7:0] 	matrix_p11, matrix_p12, matrix_p13;//3x3 materix output 
wire 	[7:0]	matrix_p21, matrix_p22, matrix_p23;
wire 	[7:0]	matrix_p31, matrix_p32, matrix_p33;
wire 			matrix_clken, matrix_vsync;

Shift_RAM_3X3 u_Shift_RAM_3X3(
	//global signals
	.clk								(clk),
	.rst_n								(rst_n),
	//Image data prepred to be processd
	.per_clken							(per_clken),	//Prepared Image data output/capture enable clock
	.per_vsync                          (per_vsync),
	.per_img_Y							(per_img_bit),	//Prepared Image brightness input

	//Image data has been processd
	.matrix_clken						(matrix_clken),	//Prepared Image data output/capture enable clock	
	.matrix_vsync                       (matrix_vsync),
	.matrix_p11							(matrix_p11),
	.matrix_p12							(matrix_p12),
	.matrix_p13							(matrix_p13),	//3X3 Matrix output
	.matrix_p21							(matrix_p21),
	.matrix_p22							(matrix_p22),
	.matrix_p23							(matrix_p23),
	.matrix_p31							(matrix_p31),
	.matrix_p32							(matrix_p32),
	.matrix_p33							(matrix_p33)
);	
	
//Add you arithmetic here
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//-------------------------------------------
//-------------------------------------------
//Eronsion Parameter
//      Original         Dilation			  Pixel
// [   0  0   0  ]   [   1	1   1 ]     [   P1  P2   P3 ]
// [   0  1   0  ]   [   1  1   1 ]     [   P4  P5   P6 ]
// [   0  0   0  ]   [   1  1	1 ]     [   P7  P8   P9 ]
//P = P1 | P2 | P3 | P4 | P5 | P6 | P7 | 8 | 9;
//---------------------------------------
//Eonsion with or operation
//Step1
reg	[7:0] post_img_Bit1;	
reg [7:0] post_img_Bit2;	
reg [7:0] post_img_Bit3;
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		begin
		post_img_Bit1 <= 8'b0000_0000;
		post_img_Bit2 <= 8'b0000_0000;
		post_img_Bit3 <= 8'b0000_0000;
		end
	else
		begin
		if (matrix_p11 == 8'b1111_1111 || matrix_p12 == 8'b1111_1111 || matrix_p13 == 8'b1111_1111)
		    post_img_Bit1 <= 8'b1111_1111;
		else
		    post_img_Bit1 <= 8'b0000_0000;
		
		if (matrix_p21 == 8'b1111_1111 || matrix_p22 == 8'b1111_1111 || matrix_p23 == 8'b1111_1111)
		    post_img_Bit2 <= 8'b1111_1111;
		else
		    post_img_Bit2 <= 8'b0000_0000;
		
		if (matrix_p31 == 8'b1111_1111 || matrix_p32 == 8'b1111_1111 || matrix_p33 == 8'b1111_1111)
		    post_img_Bit3 <= 8'b1111_1111;
		else
		    post_img_Bit3 <= 8'b0000_0000;
		
		/*post_img_Bit1 <= matrix_p11 | matrix_p12 | matrix_p13;
		post_img_Bit2 <= matrix_p21 | matrix_p22 | matrix_p23;
		post_img_Bit3 <= matrix_p21 | matrix_p32 | matrix_p33;*/
		end
end

//Step 2
reg	[7:0] post_img_Bit4;
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		post_img_Bit4 <= 8'b0000_0000;
	else begin
	   if (post_img_Bit1 == 8'b1111_1111 || post_img_Bit2 == 8'b1111_1111 || post_img_Bit3 == 8'b1111_1111)
		    post_img_Bit4 <= 8'b1111_1111;
		else
		    post_img_Bit4 <= 8'b0000_0000;
	end
		//post_img_Bit4 <= post_img_Bit1 | post_img_Bit2 | post_img_Bit3;
end	
	
//-------------------------------------------
//per_clken delay 2clk	
reg 	[1:0]	per_clken_r;
reg     [1:0]   per_vsync_r;
always @(posedge clk or negedge rst_n)begin
	if(!rst_n) begin
		per_clken_r <= 2'b0;
		per_vsync_r <= 2'b0;
	end
	else begin
		per_clken_r <= {per_clken_r[0], matrix_clken};
		per_vsync_r <= {per_vsync_r[0], matrix_vsync};
	end
		
end

assign	post_clken 		= 	per_clken_r[1];	
assign  post_vsync      =   per_vsync_r[1];
assign	post_img_bit	=	post_img_Bit4;	
	
	
	
endmodule

/*-----------------------------------------------------------------------
								 \\\|///
							   \\  - -  //
								(  @ @  )
+-----------------------------oOOo-(_)-oOOo-----------------------------+
CONFIDENTIAL IN CONFIDENCE
This confidential and proprietary software may be only used as authorized
by a licensing agreement from CrazyBingo (Thereturnofbingo).
In the event of publication, the following notice is applicable:
Copyright (C) 2013-20xx CrazyBingo Corporation
The entire notice above must be reproduced on all authorized copies.
Author				:		CrazyBingo
Technology blogs 	: 		http://blog.chinaaet.com/crazybingo
Email Address 		: 		thereturnofbingo@gmail.com
Filename			:		lcd_para.v
Data				:		2012-02-18
Description			:		LCD/VGA driver parameter.
Modification History	:
Data			By			Version			Change Description
=========================================================================
12/02/18		CrazyBingo	1.0				Original
12/03/19		CrazyBingo	1.1				Modification
12/03/21		CrazyBingo	1.2				Modification
12/05/13		CrazyBingo	1.3				Modification
13/11/07		CrazyBingo	2.1				Modification
-------------------------------------------------------------------------
|                                     Oooo								|
+------------------------------oooO--(   )-----------------------------+
                              (   )   ) /
                               \ (   (_/
                                \_)
----------------------------------------------------------------------*/

`timescale 1ns/1ns

//-----------------------------------------------------------------------
//Define the color parameter RGB--5|6|5
//define colors RGB--5|6|5
//`define RED		16'hF800   /*111110,000000,000000	F800 */
//`define GREEN	16'h07E0   /*000000,111111,000000	07E0 */
//`define BLUE  	16'h001F   /*000000,000000,111110	001F */
//`define WHITE 	16'hFFFF   /*111110,111111,111110	FFFF */
//`define BLACK 	16'h0000   /*000000,000000,000000	0000 */
//`define YELLOW	16'hFFE0   /*111110,111111,000000	FFE0 */
//`define CYAN  	16'hF81F   /*111110,000000,111110	F81F */
//`define ROYAL 	16'h07FF   /*000000,111111,111110	07FF */ 

//---------------------------------
`define	SYNC_POLARITY 1'b0

//------------------------------------
//vga parameter define

`define	VGA_640_480_60FPS_25MHz
//`define	VGA_800_600_72FPS_50MHz
//`define	VGA_1024_768_60FPS_65MHz 
//`define	VGA_1440_900_60FPS_105MHz
//`define	VGA_1280_1024_60FPS_105MHz

//---------------------------------
//	640 * 480
`ifdef	VGA_640_480_60FPS_25MHz
`define	H_FRONT	11'd16
`define	H_SYNC 	11'd96  
`define	H_BACK 	11'd48  
`define	H_DISP	11'd640 
`define	H_TOTAL	11'd800 	
 					
`define	V_FRONT	11'd10  
`define	V_SYNC 	11'd2   
`define	V_BACK 	11'd33 
`define	V_DISP 	11'd480   
`define	V_TOTAL	11'd525
`endif

//---------------------------------
//	800 * 600
`ifdef VGA_800_600_72FPS_50MHz 
`define	H_FRONT	11'd56 
`define	H_SYNC 	11'd120  
`define	H_BACK 	11'd64  
`define	H_DISP 	11'd800
`define	H_TOTAL	11'd1040 
					
`define	V_FRONT	11'd37  
`define	V_SYNC 	11'd6   
`define	V_BACK 	11'd23  
`define	V_DISP 	11'd600  
`define	V_TOTAL	11'd666
`endif

//---------------------------------
//	1024 * 768	
`ifdef	VGA_1024_768_60FPS_65MHz
`define H_FRONT	11'd24	 
`define H_SYNC 	11'd136  
`define H_BACK 	11'd160 
`define H_DISP 	11'd1024  
`define H_TOTAL	11'd1344 
 					
`define V_FRONT	11'd3 
`define V_SYNC 	11'd6    
`define V_BACK 	11'd29   
`define V_DISP 	11'd768
`define V_TOTAL	11'd806
`endif

//---------------------------------
//	1440 * 900
`ifdef	VGA_1440_900_60FPS_105MHz
`define	H_FRONT	11'd80
`define	H_SYNC 	11'd152  
`define	H_BACK 	11'd252  
`define	H_DISP	11'd1440 
`define	H_TOTAL	11'd1904	
 					
`define	V_FRONT	11'd1  
`define	V_SYNC 	11'd3   
`define	V_BACK 	11'd28 
`define	V_DISP 	11'd900   
`define	V_TOTAL	11'd932
`endif

//---------------------------------
//	1280 * 1024
`ifdef	VGA_1280_1024_60FPS_105MHz
`define	H_FRONT	11'd48
`define	H_SYNC 	11'd112
`define	H_BACK 	11'd248
`define	H_DISP	11'd1280
`define	H_TOTAL	11'd1688
 					
`define	V_FRONT	11'd1
`define	V_SYNC 	11'd3   
`define	V_BACK 	11'd38 
`define	V_DISP 	11'd1024   
`define	V_TOTAL	11'd1066
`endif
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2700185 Thu Oct 24 18:46:05 MDT 2019
// Date        : Sun Feb  2 15:19:57 2020
// Host        : DESKTOP-QCQ218O running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/ip/frame_buffer/frame_buffer_stub.v
// Design      : frame_buffer
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2019.2" *)
module frame_buffer(clka, wea, addra, dina, clkb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[16:0],dina[15:0],clkb,addrb[16:0],doutb[15:0]" */;
  input clka;
  input [0:0]wea;
  input [16:0]addra;
  input [15:0]dina;
  input clkb;
  input [16:0]addrb;
  output [15:0]doutb;
endmodule

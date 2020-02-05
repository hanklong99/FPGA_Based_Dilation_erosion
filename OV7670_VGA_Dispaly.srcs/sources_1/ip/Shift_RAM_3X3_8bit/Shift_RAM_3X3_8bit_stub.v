// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2700185 Thu Oct 24 18:46:05 MDT 2019
// Date        : Wed Feb  5 15:07:59 2020
// Host        : DESKTOP-QCQ218O running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/11986/Desktop/Dilation_erosion/OV7670_VGA_Dispaly.srcs/sources_1/ip/Shift_RAM_3X3_8bit/Shift_RAM_3X3_8bit_stub.v
// Design      : Shift_RAM_3X3_8bit
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_shift_ram_v12_0_14,Vivado 2019.2" *)
module Shift_RAM_3X3_8bit(D, CLK, CE, SCLR, Q)
/* synthesis syn_black_box black_box_pad_pin="D[7:0],CLK,CE,SCLR,Q[7:0]" */;
  input [7:0]D;
  input CLK;
  input CE;
  input SCLR;
  output [7:0]Q;
endmodule

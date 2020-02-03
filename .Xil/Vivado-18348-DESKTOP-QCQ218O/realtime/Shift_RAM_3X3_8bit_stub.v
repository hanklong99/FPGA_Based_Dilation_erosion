// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_shift_ram_v12_0_14,Vivado 2019.2" *)
module Shift_RAM_3X3_8bit(D, CLK, CE, SCLR, Q);
  input [7:0]D;
  input CLK;
  input CE;
  input SCLR;
  output [7:0]Q;
endmodule

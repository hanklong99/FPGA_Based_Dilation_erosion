// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clock(clk_out1, resetn, clk_in1);
  output clk_out1;
  input resetn;
  input clk_in1;
endmodule

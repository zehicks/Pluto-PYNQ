// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Tue Mar 12 22:15:55 2024
// Host        : pls-work-iv running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top system_out_mux_0_0 -prefix
//               system_out_mux_0_0_ system_out_mux_0_0_stub.v
// Design      : system_out_mux_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg225-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ad_bus_mux,Vivado 2022.1" *)
module system_out_mux_0_0(select_path, valid_in_0, enable_in_0, 
  data_in_0, valid_in_1, enable_in_1, data_in_1, valid_out, enable_out, data_out)
/* synthesis syn_black_box black_box_pad_pin="select_path,valid_in_0,enable_in_0,data_in_0[15:0],valid_in_1,enable_in_1,data_in_1[15:0],valid_out,enable_out,data_out[15:0]" */;
  input select_path;
  input valid_in_0;
  input enable_in_0;
  input [15:0]data_in_0;
  input valid_in_1;
  input enable_in_1;
  input [15:0]data_in_1;
  output valid_out;
  output enable_out;
  output [15:0]data_out;
endmodule

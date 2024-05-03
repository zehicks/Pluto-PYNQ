// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Tue Mar 12 22:15:08 2024
// Host        : pls-work-iv running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top system_rate_gen_0 -prefix
//               system_rate_gen_0_ system_rate_gen_0_stub.v
// Design      : system_rate_gen_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg225-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "util_pulse_gen,Vivado 2022.1" *)
module system_rate_gen_0(clk, rstn, pulse_width, pulse_period, 
  load_config, pulse, pulse_counter)
/* synthesis syn_black_box black_box_pad_pin="clk,rstn,pulse_width[31:0],pulse_period[31:0],load_config,pulse,pulse_counter[31:0]" */;
  input clk;
  input rstn;
  input [31:0]pulse_width;
  input [31:0]pulse_period;
  input load_config;
  output pulse;
  output [31:0]pulse_counter;
endmodule

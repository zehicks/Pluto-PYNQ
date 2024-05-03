// (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:ad_bus_mux:1.0
// IP Revision: 1

(* X_CORE_INFO = "ad_bus_mux,Vivado 2022.1" *)
(* CHECK_LICENSE_TYPE = "system_out_mux_1_0,ad_bus_mux,{}" *)
(* CORE_GENERATION_INFO = "system_out_mux_1_0,ad_bus_mux,{x_ipProduct=Vivado 2022.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=ad_bus_mux,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,DATA_WIDTH=16}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module system_out_mux_1_0 (
  select_path,
  valid_in_0,
  enable_in_0,
  data_in_0,
  valid_in_1,
  enable_in_1,
  data_in_1,
  valid_out,
  enable_out,
  data_out
);

input wire select_path;
input wire valid_in_0;
input wire enable_in_0;
input wire [15 : 0] data_in_0;
input wire valid_in_1;
input wire enable_in_1;
input wire [15 : 0] data_in_1;
output wire valid_out;
output wire enable_out;
output wire [15 : 0] data_out;

  ad_bus_mux #(
    .DATA_WIDTH(16)
  ) inst (
    .select_path(select_path),
    .valid_in_0(valid_in_0),
    .enable_in_0(enable_in_0),
    .data_in_0(data_in_0),
    .valid_in_1(valid_in_1),
    .enable_in_1(enable_in_1),
    .data_in_1(data_in_1),
    .valid_out(valid_out),
    .enable_out(enable_out),
    .data_out(data_out)
  );
endmodule

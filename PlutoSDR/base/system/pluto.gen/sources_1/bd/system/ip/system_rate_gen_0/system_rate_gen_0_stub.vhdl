-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
-- Date        : Tue Mar 12 22:15:08 2024
-- Host        : pls-work-iv running 64-bit Ubuntu 20.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top system_rate_gen_0 -prefix
--               system_rate_gen_0_ system_rate_gen_0_stub.vhdl
-- Design      : system_rate_gen_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg225-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_rate_gen_0 is
  Port ( 
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC;
    pulse_width : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pulse_period : in STD_LOGIC_VECTOR ( 31 downto 0 );
    load_config : in STD_LOGIC;
    pulse : out STD_LOGIC;
    pulse_counter : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end system_rate_gen_0;

architecture stub of system_rate_gen_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rstn,pulse_width[31:0],pulse_period[31:0],load_config,pulse,pulse_counter[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "util_pulse_gen,Vivado 2022.1";
begin
end;

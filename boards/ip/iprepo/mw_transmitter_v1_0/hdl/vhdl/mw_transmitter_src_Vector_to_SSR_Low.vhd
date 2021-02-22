-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\mw_transmitter\mw_transmitter_src_Vector_to_SSR_Low.vhd
-- Created: 2020-12-16 17:01:18
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: mw_transmitter_src_Vector_to_SSR_Low
-- Source Path: mw_transmitter/Transmitter/Vector to SSR Low
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.mw_transmitter_src_Transmitter_pkg.ALL;

ENTITY mw_transmitter_src_Vector_to_SSR_Low IS
  PORT( Vector                            :   IN    vector_of_std_logic_vector32(0 TO 3);  -- uint32 [4]
        SSR                               :   OUT   std_logic_vector(127 DOWNTO 0)  -- ufix128
        );
END mw_transmitter_src_Vector_to_SSR_Low;


ARCHITECTURE rtl OF mw_transmitter_src_Vector_to_SSR_Low IS

  -- Signals
  SIGNAL Vector_3                         : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Vector_2                         : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Vector_1                         : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Vector_0                         : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Bit_Concat_out1                  : unsigned(127 DOWNTO 0);  -- ufix128

BEGIN
  Vector_3 <= unsigned(Vector(3));

  Vector_2 <= unsigned(Vector(2));

  Vector_1 <= unsigned(Vector(1));

  Vector_0 <= unsigned(Vector(0));

  Bit_Concat_out1 <= Vector_3 & Vector_2 & Vector_1 & Vector_0;

  SSR <= std_logic_vector(Bit_Concat_out1);

END rtl;

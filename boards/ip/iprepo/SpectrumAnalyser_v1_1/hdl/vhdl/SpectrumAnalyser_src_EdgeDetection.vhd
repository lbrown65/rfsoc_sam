-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser_src_EdgeDetection.vhd
-- Created: 2021-03-09 14:00:48
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser_src_EdgeDetection
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/Preprocessing Window/Direct 
-- Memory Access/EdgeDetectio
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyser_src_EdgeDetection IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        In1                               :   IN    std_logic;  -- ufix1
        Out1                              :   OUT   std_logic
        );
END SpectrumAnalyser_src_EdgeDetection;


ARCHITECTURE rtl OF SpectrumAnalyser_src_EdgeDetection IS

  -- Signals
  SIGNAL Delay_out1                       : std_logic;  -- ufix1
  SIGNAL Logical_Operator1_out1           : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;

BEGIN
  Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Delay_out1 <= In1;
      END IF;
    END IF;
  END PROCESS Delay_process;


  Logical_Operator1_out1 <=  NOT Delay_out1;

  Logical_Operator_out1 <= Logical_Operator1_out1 AND In1;

  Out1 <= Logical_Operator_out1;

END rtl;


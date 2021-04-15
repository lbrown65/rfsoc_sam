-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser_src_SSR_Packet_Generator_Real.vhd
-- Created: 2021-03-09 14:00:49
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser_src_SSR_Packet_Generator_Real
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/SSR Subset Converter/SSR 
-- Packet Generator Rea
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyser_src_SSR_Packet_Generator_Real IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        Frame_Drop                        :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        Valid_In                          :   IN    std_logic;
        Data_In                           :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
        Packet_Size                       :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Valid_Out                         :   OUT   std_logic;
        Data_Out                          :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
        SoF_Out                           :   OUT   std_logic;
        EoF_Out                           :   OUT   std_logic
        );
END SpectrumAnalyser_src_SSR_Packet_Generator_Real;


ARCHITECTURE rtl OF SpectrumAnalyser_src_SSR_Packet_Generator_Real IS

  -- Component Declarations
  COMPONENT SpectrumAnalyser_src_TLAST_Generator_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          Valid_In                        :   IN    std_logic;
          Data_In                         :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
          Packet_Size                     :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          Valid_Out                       :   OUT   std_logic;
          Data_Out                        :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
          SoF_Out                         :   OUT   std_logic;
          EoF_Out                         :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT SpectrumAnalyser_src_Frame_Dropper_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          Valid_In                        :   IN    std_logic;
          Data_In                         :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
          SoF_In                          :   IN    std_logic;
          EoF_In                          :   IN    std_logic;
          Frame_Drop                      :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          Valid_Out                       :   OUT   std_logic;
          Data_Out                        :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
          SoF_Out                         :   OUT   std_logic;
          EoF_Out                         :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SpectrumAnalyser_src_TLAST_Generator_block
    USE ENTITY work.SpectrumAnalyser_src_TLAST_Generator_block(rtl);

  FOR ALL : SpectrumAnalyser_src_Frame_Dropper_block
    USE ENTITY work.SpectrumAnalyser_src_Frame_Dropper_block(rtl);

  -- Signals
  SIGNAL TLAST_Generator_out1             : std_logic;
  SIGNAL y                                : std_logic_vector(127 DOWNTO 0);  -- ufix128
  SIGNAL TLAST_Generator_out3             : std_logic;
  SIGNAL TLAST_Generator_out4             : std_logic;
  SIGNAL Frame_Dropper_out1               : std_logic;
  SIGNAL y_1                              : std_logic_vector(127 DOWNTO 0);  -- ufix128
  SIGNAL Frame_Dropper_out3               : std_logic;
  SIGNAL Frame_Dropper_out4               : std_logic;

BEGIN
  u_TLAST_Generator : SpectrumAnalyser_src_TLAST_Generator_block
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              Valid_In => Valid_In,
              Data_In => Data_In,  -- ufix128
              Packet_Size => Packet_Size,  -- uint32
              Valid_Out => TLAST_Generator_out1,
              Data_Out => y,  -- ufix128
              SoF_Out => TLAST_Generator_out3,
              EoF_Out => TLAST_Generator_out4
              );

  u_Frame_Dropper : SpectrumAnalyser_src_Frame_Dropper_block
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              Valid_In => TLAST_Generator_out1,
              Data_In => y,  -- ufix128
              SoF_In => TLAST_Generator_out3,
              EoF_In => TLAST_Generator_out4,
              Frame_Drop => Frame_Drop,  -- ufix4
              Valid_Out => Frame_Dropper_out1,
              Data_Out => y_1,  -- ufix128
              SoF_Out => Frame_Dropper_out3,
              EoF_Out => Frame_Dropper_out4
              );

  Valid_Out <= Frame_Dropper_out1;

  SoF_Out <= Frame_Dropper_out3;

  EoF_Out <= Frame_Dropper_out4;

  Data_Out <= y_1;

END rtl;


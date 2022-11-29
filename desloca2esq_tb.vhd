--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:54:01 11/29/2022
-- Design Name:   
-- Module Name:   /home/202050015/202050015/Documentos/LabISLD/ExtensorSinal16t32/desloca2esq_tb.vhd
-- Project Name:  ExtensorSinal16t32
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Desloca2Esq
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY desloca2esq_tb IS
END desloca2esq_tb;
 
ARCHITECTURE behavior OF desloca2esq_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Desloca2Esq
    PORT(
         Entrada : IN  std_logic_vector(31 downto 0);
         Saida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Entrada : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Saida : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Desloca2Esq PORT MAP (
          Entrada => Entrada,
          Saida => Saida
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		Entrada <= x"00000001";
		
		wait for 100 ns;

		Entrada <= x"00000010";

      -- insert stimulus here 

      wait;
   end process;

END;

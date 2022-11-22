--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:15:14 11/22/2022
-- Design Name:   
-- Module Name:   /home/202050015/202050015/Documentos/LabISLD/Decodificador32b/decodificador32b_tb.vhd
-- Project Name:  Decodificador32b
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decodificador32b
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
 
ENTITY decodificador32b_tb IS
END decodificador32b_tb;
 
ARCHITECTURE behavior OF decodificador32b_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decodificador32b
    PORT(
         endR : IN  std_logic_vector(4 downto 0);
         saida : OUT  std_logic_vector(0 to 31)
        );
    END COMPONENT;
    

   --Inputs
   signal endR : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal saida : std_logic_vector(0 to 31);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decodificador32b PORT MAP (
          endR => endR,
          saida => saida
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		endR <= "00000";
		
		assert saida(0) = '1' report "A1" severity warning;

      wait for 100 ns;	

		endR <= "00001";
		
		assert saida(1) = '1' report "A2" severity warning;

      wait for 100 ns;	

		endR <= "00010";
		
		assert saida(2) = '1' report "A3" severity warning;

      wait;
   end process;

END;

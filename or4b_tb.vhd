----------------------------------------------------------------------------------
-- Company: UFSJ
-- Engineer: Juan Aleixo, Henrique Mendes, Gustavo Damasceno, Wesley 
-- 
-- Create Date:   18:18:06 11/08/2022
-- Design Name:   
-- Module Name:   /scratch/convidado/Desktop/processador_or/or32bits/or4b_tb.vhd
-- Project Name:  or32bits
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: or4b
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
 
ENTITY or4b_tb IS
END or4b_tb;
 
ARCHITECTURE behavior OF or4b_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT or4b
    PORT(
         vec : IN  std_logic_vector(3 downto 0);
         o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal vec : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal o : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: or4b PORT MAP (
          vec => vec,
          o => o
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		vec <= "0001";

		assert o = '0' report "ERROR" severity warning;
		
		wait for 100 ns;

		vec <= "0000";

		assert o = '1' report "ERROR" severity warning;
		
      wait;
   end process;

END;

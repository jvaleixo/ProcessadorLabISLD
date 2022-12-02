--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:24:36 12/02/2022
-- Design Name:   
-- Module Name:   /scratch/convidado/Documents/vhd/processador_monociclo/pc_prox_tb.vhd
-- Project Name:  processador_monociclo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: processador_monociclo
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
 
ENTITY pc_prox_tb IS
END pc_prox_tb;
 
ARCHITECTURE behavior OF pc_prox_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT processador_monociclo
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         enable : IN  std_logic;
         tb_pc : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal enable : std_logic := '0';

 	--Outputs
   signal tb_pc : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: processador_monociclo PORT MAP (
          clock => clock,
          reset => reset,
          enable => enable,
          tb_pc => tb_pc
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
	
		enable <='1';
		reset <= '1';
		clock <= '0';
		
		wait for 50 ns;
		
		
		clock <= '1';
		
		wait for 50 ns;
		
		reset <= '0';
		clock <= '0';
		
		wait for 50 ns;
		
		clock <= '1';
		
		wait for 50 ns;
			
		clock <= '0';
		
		wait for 50 ns;
		
		clock <= '1';
		
		wait for 50 ns;
		
      wait;
   end process;

END;

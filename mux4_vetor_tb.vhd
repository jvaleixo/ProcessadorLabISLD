--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:31:46 11/08/2022
-- Design Name:   
-- Module Name:   /scratch/convidado/Documents/mux4_vetor/mux4_vetor_tb.vhd
-- Project Name:  mux4_vetor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux4_vetor
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
 
ENTITY mux4_vetor_tb IS
END mux4_vetor_tb;
 
ARCHITECTURE behavior OF mux4_vetor_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux4_vetor
    PORT(
         e : IN  std_logic_vector(3 downto 0);
         sel : IN  std_logic_vector(1 downto 0);
         saida : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal e : std_logic_vector(3 downto 0) := (others => '0');
   signal sel : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal saida : std_logic;

  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux4_vetor PORT MAP (
          e => e,
          sel => sel,
          saida => saida
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here
		e(0) <= '1';
		e(1) <= '0';
		e(2) <= '0';
		e(3) <= '0';
		sel(0) <= '0';
		sel(1) <= '0';
		
		wait for 100 ns;
		
		e(0) <= '1';
		e(1) <= '0';
		e(2) <= '1';
		e(3) <= '0';
		sel(0) <= '1';
		sel(1) <= '0';
		
		wait for 100 ns;
		
		e(0) <= '1';
		e(1) <= '0';
		e(2) <= '1';
		e(3) <= '0';
		sel(0) <= '0';
		sel(1) <= '1';
		
		wait for 100 ns;
		
		e(0) <= '1';
		e(1) <= '0';
		e(2) <= '1';
		e(3) <= '0';
		sel(0) <= '1';
		sel(1) <= '1';
		
		wait for 100 ns;
 
      wait;
   end process;

END;

--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:23:58 11/29/2022
-- Design Name:   
-- Module Name:   /scratch/convidado/Documents/vhd/Unidade_de_Controle/uc_tb.vhd
-- Project Name:  Unidade_de_Controle
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: unidade_de_controle
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
 
ENTITY uc_tb IS
END uc_tb;
 
ARCHITECTURE behavior OF uc_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT unidade_de_controle
    PORT(
         Opcode : IN  std_logic_vector(5 downto 0);
         RegWrite : OUT  std_logic;
         RegDst : OUT  std_logic;
         ALUScr : OUT  std_logic;
         Branch : OUT  std_logic;
         MemWrite : OUT  std_logic;
         MemToReg : OUT  std_logic;
         Jump : OUT  std_logic;
         MemRead : OUT  std_logic;
         ALUOp : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Opcode : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal RegWrite : std_logic;
   signal RegDst : std_logic;
   signal ALUScr : std_logic;
   signal Branch : std_logic;
   signal MemWrite : std_logic;
   signal MemToReg : std_logic;
   signal Jump : std_logic;
   signal MemRead : std_logic;
   signal ALUOp : std_logic_vector(1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: unidade_de_controle PORT MAP (
          Opcode => Opcode,
          RegWrite => RegWrite,
          RegDst => RegDst,
          ALUScr => ALUScr,
          Branch => Branch,
          MemWrite => MemWrite,
          MemToReg => MemToReg,
          Jump => Jump,
          MemRead => MemRead,
          ALUOp => ALUOp
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		Opcode <= "000000";
		
		wait for 10 ns; 
		
      wait;
   end process;

END;

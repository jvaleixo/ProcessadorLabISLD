--------------------------------------------------------------------------------
-- Company: UFSJ
-- Engineer:
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY uc_ula_tb IS
END uc_ula_tb;
 
ARCHITECTURE behavior OF uc_ula_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT uc_ula
    PORT(
         ALUOp : IN  std_logic_vector(1 downto 0);
         funct : IN  std_logic_vector(5 downto 0);
         OP : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ALUOp : std_logic_vector(1 downto 0) := (others => '0');
   signal funct : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal OP : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: uc_ula PORT MAP (
          ALUOp => ALUOp,
          funct => funct,
          OP => OP
        );
 

   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		funct <= "100000";
		ALUOp <= "10";
		
		wait for 10 ns;
		
		funct <= "100100";
		
		wait for 10 ns;
		
		ALUOp <= "00";
		
		wait for 10 ns;
		
		ALUOp <= "01";
		
		wait for 10 ns;
	
		funct <= "100010";
		ALUOp <= "10";
		
		wait for 10 ns;


      wait;
   end process;

END;

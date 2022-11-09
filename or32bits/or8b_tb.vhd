
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY or8b_tb IS
END or8b_tb;
 
ARCHITECTURE behavior OF or8b_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT or8b
    PORT(
         vec : IN  std_logic_vector(7 downto 0);
         o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal vec : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal o : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: or8b PORT MAP (
          vec => vec,
          o => o
        );

   -- Clock process definitions

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      -- insert stimulus here 

		vec <= "00000001";

		assert o = '0' report "ERROR" severity warning;
		
		wait for 100 ns;

		vec <= "00000000";

		assert o = '1' report "ERROR" severity warning;
      wait;
   end process;

END;

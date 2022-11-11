--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ula_1bit_tb IS
END ula_1bit_tb;
 
ARCHITECTURE behavior OF ula_1bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ula_1bit
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         ci : IN  std_logic;
         less : IN  std_logic;
         op : IN  std_logic_vector(3 downto 0);
         r : OUT  std_logic;
         set : OUT  std_logic;
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal ci : std_logic := '0';
   signal less : std_logic := '0';
   signal op : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal r : std_logic;
   signal set : std_logic;
   signal cout : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ula_1bit PORT MAP (
          a => a,
          b => b,
          ci => ci,
          less => less,
          op => op,
          r => r,
          set => set,
          cout => cout
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		
		op <= "0000";
		a <= '1';
		b <= '1';
		ci <= '0';
		less <= '0';
		
		wait for 10 ns;
		
		op <= "0001";
		a <= '0';
		b <= '1';
		ci <= '0';
		less <= '0';
		
		wait for 10 ns;
		
		op <= "0010";
		a <= '1';
		b <= '1';
		ci <= '0';
		less <= '0';
		
		wait for 10 ns;
		
		op <= "0110";
		a <= '1';
		b <= '1';
		ci <= '1';
		less <= '0';
		
		wait for 10 ns;

      wait;
   end process;

END;

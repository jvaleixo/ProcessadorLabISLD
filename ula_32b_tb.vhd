--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ula_32b_tb IS
END ula_32b_tb;
 
ARCHITECTURE behavior OF ula_32b_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ula_32bits
    PORT(
         a : IN  std_logic_vector(31 downto 0);
         b : IN  std_logic_vector(31 downto 0);
         op : IN  std_logic_vector(3 downto 0);
         result : OUT  std_logic_vector(31 downto 0);
         zero : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal b : std_logic_vector(31 downto 0) := (others => '0');
   signal op : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(31 downto 0);
   signal zero : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ula_32bits PORT MAP (
          a => a,
          b => b,
          op => op,
          result => result,
          zero => zero
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      
		wait for 100 ns;

		-- AND
		OP <= "0000";      
		A <= x"FFFFFFFF";
		B <= x"FFFFFFFF";
		wait for 10 ns;
		assert Result = x"FFFFFFFF" report "AND 1.1" & CR & LF severity WARNING;		
		A <= x"FFFFFFFF";
		B <= x"00000000";
		wait for 10 ns;		
		assert Result = x"00000000" report "AND 1.0" & CR & LF severity WARNING;		
		A <= x"00000000";
		B <= x"00000000";
		wait for 10 ns;		
		assert Result = x"00000000" report "AND 0.0" & CR & LF severity WARNING;		

		-- OR
		OP <= "0001";
		A <= x"FFFFFFFF";
		B <= x"FFFFFFFF";
		wait for 10 ns;			
		assert Result = x"FFFFFFFF" report "OR 1+1" & CR & LF severity WARNING;		
		A <= x"FFFFFFFF";
		B <= x"00000000";
		wait for 10 ns;		
		assert Result = x"FFFFFFFF" report "OR 1+0" & CR & LF severity WARNING;				
		A <= x"00000000";
		B <= x"00000000";
		wait for 10 ns;		
		assert Result = x"00000000" report "OR 0+0" & CR & LF severity WARNING;				

		-- NOR
		OP <= "1100";
		A <= x"FFFFFFFF";
		B <= x"FFFFFFFF";
		wait for 10 ns;		
		assert Result = x"00000000" report "NOR (1+1)'" & CR & LF severity WARNING;				
		A <= x"FFFFFFFF";
		B <= x"00000000";
		wait for 10 ns;		
		assert Result = x"00000000" report "NOR (1+0)'" & CR & LF severity WARNING;						
		A <= x"00000000";
		B <= x"00000000";
		wait for 10 ns;		
		assert Result = x"FFFFFFFF" report "NOR (0+0)'" & CR & LF severity WARNING;						
		
		-- Soma
		OP <= "0010";		
		A <= x"00000000";
		B <= x"FFFFFFFF";
		wait for 10 ns;		
		assert Result = x"FFFFFFFF" report "Soma 0 + (-1)" & CR & LF severity WARNING;						
		A <= x"00000001";
		B <= x"FFFFFFFF";
		wait for 10 ns;		
		assert Result = x"00000000" report "Soma 1 + (-1)" & CR & LF severity WARNING;						
		A <= x"FFFFFFFF";
		B <= x"FFFFFFFF";
		wait for 10 ns;		
		assert Result = x"FFFFFFFE" report "Soma -1 + (-1)" & CR & LF severity WARNING;						
		A <= x"0000000A"; -- 10
		B <= x"FFFFFFEC"; -- -20
		wait for 10 ns;		
		assert Result = x"FFFFFFF6" report "Soma 10 + (-20)" & CR & LF severity WARNING;						
		A <= x"FFFFFFEC"; -- -20
		B <= x"0000000A"; -- 10
		wait for 10 ns;		
		assert Result = x"FFFFFFF6" report "Soma -20 + 10" & CR & LF severity WARNING;						
				
		-- Subtracao
		OP <= "0110";
		A <= x"00000000";
		B <= x"FFFFFFFF";
		wait for 10 ns;		
		assert Result = x"00000001" report "Subtracao 0 - (-1)" & CR & LF severity WARNING;						
		A <= x"00000001";
		B <= x"FFFFFFFF";
		wait for 10 ns;		
		assert Result = x"00000002" report "Subtracao 1 - (-1)" & CR & LF severity WARNING;						
		A <= x"FFFFFFFF"; 
		B <= x"FFFFFFFF";
		wait for 10 ns;		
		assert Result = x"00000000" report "Subtracao -1 - (-1)" & CR & LF severity WARNING;								
		A <= x"0000000A"; -- 10
		B <= x"FFFFFFEC"; -- -20
		wait for 10 ns;		
		assert Result = x"0000001E" report "Subtracao 10 - (-20)" & CR & LF severity WARNING;						
		A <= x"FFFFFFEC"; -- -20
		B <= x"0000000A"; -- 10
		wait for 10 ns;		
		assert Result = x"FFFFFFE2" report "Subtracao -20 - (10)" & CR & LF severity WARNING;						
		
		-- SLT
		OP <= "0111";
		A <= x"00000000";
		B <= x"FFFFFFFF";
		wait for 10 ns;		
		assert Result = x"00000000" report "Comparacao 0 < -1" & CR & LF severity WARNING;						
		A <= x"00000000";
		B <= x"0000000F";
		wait for 10 ns;		
		assert Result = x"00000001" report "Comparacao 0 < 15" & CR & LF severity WARNING;						
		A <= x"FFFFFFFF";
		B <= x"00000000";
		wait for 10 ns;		
		assert Result = x"00000001" report "Comparacao -1 < 0" & CR & LF severity WARNING;						
		A <= x"FFFFFFFF";
		B <= x"FFFFFFFF";
		wait for 10 ns;		
		assert Result = x"00000000" report "Comparacao -1 < -1" & CR & LF severity WARNING;						
		
		wait;
		
      		

      wait;
   end process;

END;

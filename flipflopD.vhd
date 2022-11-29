----------------------------------------------------------------------------------
-- Company: UFSJ
-- Engineer: Milene
-- Create Date:    16:49:40 05/09/2022 
-- Module Name:    flipflopD - Behavioral 
--# UCF ffd
--NET "clock" LOC = H18;
--NET "D" LOC = K18;
--NET "Reset" LOC = G18;
--NET "Q" LOC = J14;
--NET "Clock" CLOCK_DEDICATED_ROUTE = FALSE;
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flipflopD is
	port( 
			D, Reset, Clock, Enable : in std_logic ;
			Qn : out std_logic;
			Q : out std_logic
		);
end flipflopD;

architecture Behavioral of flipflopD is

begin
	ffd : process(Reset, Clock)
		variable value : std_logic;
	begin
		if (Enable = '1') then
			if(Reset = '0') then
				value := '0';
			elsif(rising_edge(Clock)) then
				value := D;			
			end if;
		end if;
		
		Q <= value;
		Qn <= not value;
	end process;
	
end Behavioral;


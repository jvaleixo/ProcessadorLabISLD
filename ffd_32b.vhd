----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ffd_32b is
	port(
		D : in std_logic_vector(31 downto 0);
		Reset, Clock, Enable : in std_logic ;
		Q : out std_logic_vector(31 downto 0)
	);
end ffd_32b;

architecture Behavioral of ffd_32b is

begin
	ffd_32 : process(Reset, Clock)
		variable value : std_logic_vector(31 downto 0);
	begin
		if(Reset = '1') then
			value := x"00000000";
		elsif(rising_edge(Clock)) then
			if(Enable = '1') then
				value := D;	
			end if;
		end if;
		
		Q <= value;
	end process;

end Behavioral;


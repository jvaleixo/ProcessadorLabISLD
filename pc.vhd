----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pc is

	port(
		entrada : in std_logic_vector(31 downto 0);
		Reset, Clock, Enable : in std_logic ;
		saida : out std_logic_vector(31 downto 0)
	);
	
end pc;

architecture Behavioral of pc is
	
begin

	pc : process(Reset, Clock)
		variable value : std_logic_vector(31 downto 0);
	begin
		if(Reset = '1') then
			value := x"00400000";
		elsif(rising_edge(Clock)) then
			if(Enable = '1') then
				value := entrada;	
			end if;
		end if;
		
		saida <= value;
	end process;

end Behavioral;


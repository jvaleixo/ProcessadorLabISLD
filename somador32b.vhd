----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somador32b is
	port(
		a, b : in std_logic_vector(31 downto 0);
		ci : in std_logic;
		cout : out std_logic;
		result : out std_logic_vector(31 downto 0)
	);
	
end somador32b;

architecture Behavioral of somador32b is

	component somador_completo
		port(
			a, b, vemUm : in std_logic;
			soma, vaiUm : out std_logic
		);
	end component;
	
	signal vemVai : std_logic_vector(30 downto 0);

begin

	somador_completo0 : somador_completo port map(
		a => a(0),
		b => b(0),
		vemUm => ci,
		vaiUm => vemVai(0),
		soma => result(0)
	);
	
	somador_completo31 : somador_completo port map(
		a => a(31),
		b => b(31),
		vemUm => vemVai(30),
		vaiUm => cout,
		soma => result(31)
	);

	somador_generate : for i in 30 downto 1 generate 
		somador32 : somador_completo port map(
			a => a(i),
			b => b(i),
			vemUm => vemVai(i-1),
			vaiUm => vemVai(i),
			soma => result(i)
		);
	end generate;

end Behavioral;

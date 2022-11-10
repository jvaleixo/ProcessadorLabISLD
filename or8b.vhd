----------------------------------------------------------------------------------
-- Company: UFSJ
-- Engineer: Juan Aleixo, Henrique Mendes, Gustavo Damasceno, Wesley 
-- 
-- Create Date:    18:10:48 11/08/2022 
-- Design Name: 
-- Module Name:    or8b - Behavioral 
-- Project Name: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or8b is
	port(
		vec : in std_logic_vector(7 downto 0);
		o : out std_logic
	);
end or8b;


architecture Behavioral of or8b is
	component or4b is 
		port(
			vec : in std_logic_vector(3 downto 0);
			o : out std_logic
		);
	end component;
	signal oA, oB : std_logic;
begin
	orA: or4b
		port map(
			vec(3 downto 0) => vec(7 downto 4),
			o => oA
		);

	orB: or4b
		port map(
			vec(3 downto 0) => vec(3 downto 0),
			o => oB
		);

	o <= oA or oB;

end Behavioral;


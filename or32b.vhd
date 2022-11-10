----------------------------------------------------------------------------------
-- Company: UFSJ
-- Engineer: Juan Aleixo, Henrique Mendes, Gustavo Damasceno, Wesley 
-- 
-- Create Date:    18:10:48 11/08/2022 
-- Design Name: 
-- Module Name:    or32b - Behavioral 
-- Project Name: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or32b is
	port(
		vec : in std_logic_vector(31 downto 0);
		o: out std_logic
	);
end or32b;

architecture Behavioral of or32b is

	component or4b is
		port(
			vec: in std_logic_vector(3 downto 0);
			o : out std_logic
		);
	end component;

	component or8b is
		port(
			vec : in std_logic_vector(7 downto 0);
			o : out std_logic
		);
	end component;

	signal v : std_logic_vector(3 downto 0);
begin
	orA: or8b
		port map(
			vec(7 downto 0) => vec(31 downto 24),
			o => v(0)
		);
	
	orB: or8b
		port map(
			vec(7 downto 0) => vec(23 downto 16),
			o => v(1)
		);

	orC: or8b
		port map(
			vec(7 downto 0) => vec(15 downto 8),
			o => v(2)
		);

	orD: or8b
		port map(
			vec(7 downto 0) => vec(7 downto 0),
			o => v(3)
		);
		
	orF: or4b
		port map(
			vec(3 downto 0) => v,
			o => o
		);
end Behavioral;


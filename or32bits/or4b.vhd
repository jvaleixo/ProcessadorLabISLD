----------------------------------------------------------------------------------
-- Company: UFSJ
-- Engineer: Juan Aleixo, Henrique Mendes, Gustavo Damasceno, Wesley 
-- 
-- Create Date:    18:10:48 11/08/2022 
-- Design Name: 
-- Module Name:    or4b - Behavioral 
-- Project Name: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or4b is
	port(
		vec: in std_logic_vector(3 downto 0);
		o : out std_logic
	);
end or4b;

architecture Behavioral of or4b is

begin
	o <= vec(3) or vec(2) or vec(1) or vec(0);
end Behavioral;


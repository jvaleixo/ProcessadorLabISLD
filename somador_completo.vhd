----------------------------------------------------------------------------------
-- Company: UFSJ
-- Engineer: Gustavo Damasceno e Wesley
-- 
-- Create Date:    13:40:46 10/17/2022 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somador_completo is
	port(
		a, b, vemUm : in std_logic;
		soma, vaiUm : out std_logic
	);
end somador_completo;

architecture Behavioral of somador_completo is

begin
	soma <= (a xor b) xor vemUm;
	vaiUm <= (a and b) or ((a xor b) and vemUm);
end Behavioral;


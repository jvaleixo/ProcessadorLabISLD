----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:41:59 11/22/2022 
-- Design Name: 
-- Module Name:    Decodificador32b - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decodificador32b is
	port(
		endR : in std_logic_vector(4 downto 0);
		saida : out std_logic_vector(0 to 31)
	);
end Decodificador32b;

architecture Behavioral of Decodificador32b is
begin
	process (endR) is
	begin
		for i in 0 to 31 loop
			if i = to_integer(unsigned(endR)) then
				saida(i) <= '1';
			else
				saida(i) <= '0';
			end if;
		end loop;
	end process;

end Behavioral;


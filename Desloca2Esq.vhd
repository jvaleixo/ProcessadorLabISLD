----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:47:09 11/29/2022 
-- Design Name: 
-- Module Name:    Desloca2Esq - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Desloca2Esq is
	port(
		Entrada : in std_logic_vector(31 downto 0);
		Saida : out std_logic_vector(31 downto 0)
	);
end Desloca2Esq;

architecture Behavioral of Desloca2Esq is

begin

	d : for i in 29 downto 0 generate
		Saida(i+2) <= Entrada(i);
	end generate;

	Saida(0) <= '0';
	Saida(1) <= '0';

end Behavioral;


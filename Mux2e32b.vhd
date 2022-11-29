----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:19:50 11/29/2022 
-- Design Name: 
-- Module Name:    Mux2e32b - Behavioral 
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

entity Mux2e32b is
	port(
		A, B : in std_logic_vector(31 downto 0);
		Selecao: in std_logic;
		Saida: out std_logic_vector(31 downto 0)
	);
end Mux2e32b;

architecture Behavioral of Mux2e32b is

	component mux2_vetor is
		port(
			e : in std_logic_vector (1 downto 0);
			sel : in std_logic;
			saida : out std_logic
		);
	end component;

begin

	saida_generate : for i in 31 downto 0 generate
		m2 : mux2_vetor port map(
			e(0) => A(i),
			e(1) => B(i),
			sel => Selecao,
			saida => Saida(i)
		);
	end generate;


end Behavioral;


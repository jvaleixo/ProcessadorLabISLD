----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 

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

entity mux4_vetor is

	port(
		e : in std_logic_vector (3 downto 0);
		sel: in std_logic_vector (1 downto 0);
		saida: out std_logic
	);
	
end mux4_vetor;

architecture Behavioral of mux4_vetor is
	
	component mux2_vetor is 
		port(
			e : in std_logic_vector (1 downto 0);
			sel : in std_logic;
			saida : out std_logic
		);
		
	end component;
	
	signal sAC, sBC : std_logic;

begin

	muxA : mux2_vetor port map (
		e(0) => e(0),
		e(1) => e(1),
		sel => sel(0),
		saida => sAC
	);

	muxB : mux2_vetor port map (
		e(0) => e(2),
		e(1) => e(3),
		sel => sel(0),
		saida => sBC
	);

	muxC : mux2_vetor port map (
		e(0) => sAC,
		e(1) => sBC,
		sel => sel(1),
		saida => saida
	);

end Behavioral;


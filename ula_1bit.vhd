----------------------------------------------------------------------------------
-- Company: UFSJ
-- Engineer: 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ula_1bit is
	port(
		a, b, ci, less : in std_logic;
		op : in std_logic_vector(3 downto 0);
		r, set, cout: out std_logic
	);
end ula_1bit;

architecture Behavioral of ula_1bit is

	component mux2_vetor is 
		port(
			e : in std_logic_vector (1 downto 0);
			sel : in std_logic;
			saida : out std_logic
		);
	end component;
	
	component mux4_vetor is 
		port(
			e : in std_logic_vector (3 downto 0);
			sel: in std_logic_vector (1 downto 0);
			saida: out std_logic
		);
	end component;
	
	component somador_completo is 
		port(
			a, b, vemUm : in std_logic;
			soma, vaiUm : out std_logic
		);
	end component;
	
	signal sA, sB, sAND, sOR, sSOMA : std_logic;

begin

	muxA : mux2_vetor port map (
		e(0) => a,
		e(1) => not a,
		sel => op(3),
		saida => sA
	);
	
	muxB : mux2_vetor port map (
		e(0) => b,
		e(1) => not b,
		sel => op(2),
		saida => sB
	);
	
	sAND <= sA and sB;
	sOR <= sA or sB;
	
	somador : somador_completo port map (
		a => sA,
		b => sB,
		vemUm => ci,
		vaiUm => cout,
		soma => sSOMA
	);
	
	muxOP : mux4_vetor port map (
		e(0) => sAND,
		e(1) => sOR,
		e(2) => sSOMA,
		e(3) => less,
		sel(0) => op(0),
		sel(1) => op(1),
		saida => r
	);
	
	set <= sSOMA;
	
end Behavioral;


----------------------------------------------------------------------------------
-- Company: UFSJ
-- Engineer: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.tipo; 

entity banco_de_registradores is
	port(
		End1, End2, EndEsc : in std_logic_vector(4 downto 0);
		DadoEsc : in std_logic_vector(31 downto 0);
		Clock, Clear, EscreverReg : in std_logic;
		DadoL1, DadoL2 : out std_logic_vector(31 downto 0)
	);
end banco_de_registradores;

architecture Behavioral of banco_de_registradores is
	
	component ffd_32b is
		port(
			D : in std_logic_vector(31 downto 0);
			Reset, Clock, Enable : in std_logic ;
			Q : out std_logic_vector(31 downto 0)
		);
	end component;
	
	component mux_32_x_32 is
		port(
			entrada : in tipo.vetor_de_palavras(0 to 31);
			selecao : in std_logic_vector(4 downto 0);
			saida : out std_logic_vector(31 downto 0)
		);
	end component;
		
	component decodificador32b is
		port(
			endR : in std_logic_vector(4 downto 0);
			saida : out std_logic_vector(0 to 31)
		);
	end component;
	
	signal decs : std_logic_vector(31 downto 0);
	signal r : tipo.vetor_de_palavras(0 to 31);
	signal ands : std_logic_vector(31 downto 0);
	
begin

	decodificador : decodificador32b port map (
		endR => EndEsc,
		saida => decs
	);
	
	ands_generate : for i in 31 downto 0 generate
		ands(i) <= EscreverReg and decs(i);
	end generate;
	
	reg_generate : for i in 31 downto 0 generate
		regs : ffd_32b port map (
			Q => r(i),
			D => DadoEsc,
			Enable => ands(i),
			clock => clock,
			reset => clear
		);
	end generate;
	
	mux1 : mux_32_x_32 port map(
			entrada => r,
			selecao => End1,
			saida => DadoL1
		);
		
	mux2 : mux_32_x_32 port map(
			entrada => r,
			selecao => End2,
			saida => DadoL2
		);

end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity processador_monociclo is
	port(
		clock, reset, enable : in std_logic;
		tb_pc : out std_logic_vector(31 downto 0)
	);
end processador_monociclo;

architecture Behavioral of processador_monociclo is

	component memInstrucoes is 
		port(
			Endereco : in std_logic_vector(31 downto 0);
			Palavra : out std_logic_vector(31 downto 0)
		);
	end component;
	
	component pc is
		port(
			entrada : in std_logic_vector(31 downto 0);
			Reset, Clock, Enable : in std_logic ;
			saida : out std_logic_vector(31 downto 0)
		);
	end component;
	
	component somador32b is
		port(
			a, b : in std_logic_vector(31 downto 0);
			ci : in std_logic;
			cout : out std_logic;
			result : out std_logic_vector(31 downto 0)
		);
	end component;
	
	signal saida_pc, saida_somador_pc, saida_memInstrucao: std_logic_vector(31 downto 0);
	
begin
	
	pcs : pc port map(
		entrada => saida_somador_pc,
		Reset => reset,
		Clock=> clock,
		Enable => enable,
		saida => saida_pc
	);
	
	somador_pc : somador32b port map(
		a => saida_pc,
		b => x"00000004",
		ci => '0',
		result => saida_somador_pc
	);
	
	instrucoes : memInstrucoes port map(
		Endereco => sinal_pc,
		Palavra	=> saida_memIntrucao
	);

tb_pc <= saida_pc;

end Behavioral;


----------------------------------------------------------------------------------
-- Company: UFSJ
-- Engineer: 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity unidade_de_controle is
	port (
		Opcode : in std_logic_vector(5 downto 0);
		RegWrite, RegDst, ALUScr, Branch, MemWrite, MemToReg, Jump, MemRead : out std_logic;
		ALUOp : out std_logic_vector(1 downto 0)
	);
end unidade_de_controle;

architecture Behavioral of unidade_de_controle is

begin

	uc : process(Opcode)
		variable instrucao : std_logic_vector(9 downto 0);
	begin 
		
		if (Opcode = "000000") then
			instrucao := "1011000000";
		elsif (Opcode = "001000") then
			instrucao := "0010100000";
		elsif (Opcode = "100011") then
			instrucao := "0010100101";
		elsif (Opcode ="101011") then
			instrucao := "0000101000";
		elsif (Opcode = "000100") then
			instrucao := "0100010000";
		elsif (Opcode = "000010") then
			instrucao := "0000000010";
		end if;
		
		ALUOp <= instrucao(9 downto 8);
		RegWrite <= instrucao(7);
		RegDst <= instrucao(6);
		ALUScr <= instrucao(5);
		Branch <= instrucao(4);
		MemWrite <= instrucao(3);
		MemToReg <= instrucao(2);
		Jump <= instrucao(1);
		MemRead <= instrucao(0);
		
	end process;
	
end Behavioral;


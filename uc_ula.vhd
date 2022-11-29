----------------------------------------------------------------------------------
-- Company: UFSJ
-- Engineer: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uc_ula is
	port (
		ALUOp : in std_logic_vector(1 downto 0);
		funct : in std_logic_vector(5 downto 0);
		OP : out std_logic_vector(3 downto 0)
	);
end uc_ula;

architecture Behavioral of uc_ula is

begin

	uc : process(ALUOp, funct)
		variable operacao : std_logic_vector(3 downto 0);
	begin 
		if (ALUOp = "10") then
			if (funct = "100000") then
				operacao := "0010";
			elsif (funct = "100010") then
				operacao := "0110";
			elsif (funct = "100100") then
				operacao := "0000";
			elsif (funct = "100111") then
				operacao := "1100";
			elsif (funct = "100101") then
				operacao := "0001";
			elsif (funct = "101010") then
				operacao := "0111";
			end if;
		elsif(ALUOp = "00") then
			operacao := "0010";
		elsif(ALUOp = "01") then
			operacao := "0100";
		end if;
		
		OP <= operacao;
		
	end process;
	
end Behavioral;


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

entity mux2_vetor is

	port (
		e : in std_logic_vector (1 downto 0);
		sel : in std_logic;
		saida : out std_logic
	);
	
end mux2_vetor;

architecture Behavioral of mux2_vetor is
	
begin

	saida <= (e(1) and sel) or (e(0) and not sel);

end Behavioral;


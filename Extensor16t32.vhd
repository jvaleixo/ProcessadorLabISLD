----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:03:17 11/29/2022 
-- Design Name: 
-- Module Name:    Extensor16t32 - Behavioral 
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

entity Extensor16t32 is
	port(
		Input : in std_logic_vector(15 downto 0);
		Output : out std_logic_vector(31 downto 0)
	);
end Extensor16t32;

architecture Behavioral of Extensor16t32 is

begin
	Output(15 downto 0) <= Input(15 downto 0);
	-- Output(31 downto 16) <= Input(15);
	
	msb_generate : for i in 31 downto 16 generate
		Output(i) <= Input(15);
	end generate;

end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ula_32bits is
	port(
		a, b : in std_logic_vector (31 downto 0);
		op : in std_logic_vector (3 downto 0);
		result : out std_logic_vector (31 downto 0);
		zero : out std_logic
	);
end ula_32bits;

architecture Behavioral of ula_32bits is

	component ula_1bit is 
		port(
			a, b, ci, less : in std_logic;
			op : in std_logic_vector(3 downto 0);
			r, set, cout: out std_logic
		);
	end component;
	
	component or32b is 
		port(
			vec : in std_logic_vector(31 downto 0);
			o: out std_logic
		);
	end component;
	
	signal vemVai : std_logic_vector (30 downto 0);
	signal r : std_logic_vector(31 downto 0);
	signal setLess : std_logic;
	
begin

	ula0 : ula_1bit port map(
		a => a(0),
		b => b(0),
		ci => op(2),
		less => setLess,
		op => op,
		r => r(0),
		cout => vemVai(0)
	);
	
	ula31 : ula_1bit port map(
		a => a(31),
		b => b(31),
		ci => vemVai(30),
		less => '0',
		op => op,
		r => r(31),
		set => setLess
	);
	
	ula_gerenate : for i in 30 downto 1 generate
		ula : ula_1bit port map (
			a => a(i),
			b => b(i),
			op => op,
			ci => vemVai(i-1),
			less => '0',
			r => r(i),
			cout => vemVai(i)
		);
	end generate;
	
	orZero : or32b port map(
		vec => r,
		o => zero
	);
	
	result <= r;

end Behavioral;


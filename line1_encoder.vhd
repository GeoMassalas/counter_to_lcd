--
-- This is the Complete encoder for the 1st line.
-- it takes the counter's output and encodes it
-- to LCD data
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity line1_encoder is
	port( input : in STD_LOGIC_VECTOR(15 downto 0);
		output : out STD_LOGIC_VECTOR(127 downto 0));
end line1_encoder;

architecture Behavioral of line1_encoder is
-- Encoder component
component encoder
	port(input : in STD_LOGIC_VECTOR(3 downto 0);
			output : out STD_LOGIC_VECTOR(7 downto 0));
end component;
-- Concatenator Component
component conc4
	port( input0, input1, input2, input3 : in STD_LOGIC_VECTOR(7 downto 0);
			output : out STD_LOGIC_VECTOR(127 downto 0));
end component;
-- Signals
signal temp0,temp1,temp2,temp3 : STD_LOGIC_VECTOR(7 downto 0);
begin
	EN0 : encoder
		port map(input => input(3 downto 0), output => temp0);
	EN1 : encoder
		port map(input => input(7 downto 4), output => temp1);
	EN2 : encoder
		port map(input => input(11 downto 8), output => temp2);
	EN3 : encoder
		port map(input => input(15 downto 12), output => temp3);
	CONC : conc4
		port map(input0 => temp0, input1 => temp1, input2 => temp2, input3 => temp3, output => output);

end Behavioral;


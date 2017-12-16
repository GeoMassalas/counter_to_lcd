--
-- This is the Complete encoder for the 1st line.
-- it takes the counter's output and encodes it
-- to LCD data
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity line2_encoder is
	port(input : in STD_LOGIC_VECTOR(15 downto 0);
		outp : out STD_LOGIC_VECTOR(127 downto 0));
end line2_encoder;

architecture Behavioral of line2_encoder is
-- Divider Component
	component divider
		port(input : in STD_LOGIC_VECTOR(15 downto 0);
			d1,d2,d3,d4,d5 : out STD_LOGIC_VECTOR(3 downto 0));
	end component;
-- Conc5 Component
	component conc5
		port( input0, input1, input2, input3, input4 : in STD_LOGIC_VECTOR(7 downto 0);
			output : out STD_LOGIC_VECTOR(127 downto 0));
	end component;
-- Encoder Component
	component encoder
		port(input : in STD_LOGIC_VECTOR(3 downto 0);
			output : out STD_LOGIC_VECTOR(7 downto 0));
	end component;
-- Signals
	signal temp0,temp1,temp2,temp3,temp4 : STD_LOGIC_VECTOR(3 downto 0);
	signal u_temp0,u_temp1,u_temp2,u_temp3,u_temp4 : STD_LOGIC_VECTOR(7 downto 0);
begin
	DIV : divider
		port map(input => input,d1 => temp0, d2 => temp1, d3 => temp2, d4 => temp3, d5 => temp4);
	EN0 : encoder
		port map(input => temp0, output => u_temp0);
	EN1 : encoder
		port map(input => temp1, output => u_temp1);
	EN2 : encoder
		port map(input => temp2, output => u_temp2);
	EN3 : encoder
		port map(input => temp3, output => u_temp3);
	EN4 : encoder
		port map(input => temp4, output => u_temp4);
	CONC : conc5
		port map(input0 => u_temp4, input1 => u_temp3, input2 => u_temp2, input3 => u_temp1, input4 => u_temp0, output => outp);

end Behavioral;


--
-- LCD driver Encoder takes as input the date
-- and translates it to LCD data
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity LCD_encoder is
	port(vector_in : in STD_LOGIC_VECTOR(15 downto 0);
			line1,line2 : out STD_LOGIC_VECTOR(127 downto 0));
end LCD_encoder;

architecture Behavioral of LCD_encoder is
-- Line 1 Encoder Component
	component line1_encoder
		port( input : in STD_LOGIC_VECTOR(15 downto 0);
			output : out STD_LOGIC_VECTOR(127 downto 0));
	end component;
-- Line 2 Encoder Component
	component line2_encoder
		port( input : in STD_LOGIC_VECTOR(15 downto 0);
			output : out STD_LOGIC_VECTOR(127 downto 0));
	end component;
	
begin
	LE1: line1_encoder
		port map(input => vector_in, output => line1);
	LE2: line2_encoder
		port map(input => vector_in, output => line2);
end Behavioral;


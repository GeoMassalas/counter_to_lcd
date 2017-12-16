--
-- Encoder build to take a 4bit vector and convert it 
-- to 8bit data for the LCD
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity encoder is
	port(input : in STD_LOGIC_VECTOR(3 downto 0);
			output : out STD_LOGIC_VECTOR(7 downto 0));
end encoder;

architecture Behavioral of encoder is

begin
	with input select
		output <= X"30" when "0000", 	-- 0
			X"31" when "0001", -- 1
			X"32" when "0010", -- 2
			X"33" when "0011", -- 3
			X"34" when "0100", -- 4
			X"35" when "0101", -- 5
			X"36" when "0110", -- 6
			X"37" when "0111", -- 7
			X"38" when "1000", -- 8
			X"39" when "1001", -- 9
			X"41" when "1010", -- A
			X"42" when "1011", -- B
			X"43" when "1100", -- C
			X"44" when "1101", -- D
			X"45" when "1110", -- E
			X"46" when "1111", -- F
			X"2A" when others;
end Behavioral;


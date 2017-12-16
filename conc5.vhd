--
-- Concatonating the 5 8bit vectors to 128bit
-- and adding X"20" which is the empty space to our LCD
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


entity conc5 is
	port( input0, input1, input2, input3, input4 : in STD_LOGIC_VECTOR(7 downto 0);
			output : out STD_LOGIC_VECTOR(127 downto 0));
end conc5;

architecture Behavioral of conc5 is

begin
	output <= input4 & input3 & input2 & input1 & input0 & X"2020202020202020202020";
end Behavioral;
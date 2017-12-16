
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


entity conc4 is
	port( input0, input1, input2, input3 : in STD_LOGIC_VECTOR(7 downto 0);
			output : out STD_LOGIC_VECTOR(127 downto 0));
end conc4;

architecture Behavioral of conc4 is

begin
	output <= input0 & input1 & input2 & input3 & X"202020202020202020202020";
end Behavioral;


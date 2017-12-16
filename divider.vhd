library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity divider is
	port(input : in STD_LOGIC_VECTOR(15 downto 0);
			d5,d1,d2,d3,d4 : out STD_LOGIC_VECTOR(3 downto 0));
end divider;

architecture Behavioral of divider is
-- Signals
	signal n,remainder : integer;
	signal temp1,temp2,temp3,temp4,temp5 : integer;
begin
	div_process : process
	begin
		n <= to_integer(unsigned(input));
		-- 1st digit
		temp1 <= n mod 10000;
		n <= n rem 10000;
		-- 2nd digit
		temp2 <= n mod 1000;
		n <= n rem 1000;
		-- 3rd digit
		temp3 <= n mod 100;
		n <= n rem 100;
		-- 4th digit
		temp4 <= n mod 10;
		temp5 <= n rem 10;
	end process;
	
	d1 <= std_logic_vector(to_unsigned(temp1, d1'length));
	d2 <= std_logic_vector(to_unsigned(temp2, d2'length));
	d3 <= std_logic_vector(to_unsigned(temp3, d3'length));
	d4 <= std_logic_vector(to_unsigned(temp4, d4'length));
	d5 <= std_logic_vector(to_unsigned(temp5, d5'length));
	
end Behavioral;


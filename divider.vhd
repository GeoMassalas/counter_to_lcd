library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity divider is
	port(input : in STD_LOGIC_VECTOR(15 downto 0);
			d1,d2,d3,d4,d5 : out STD_LOGIC_VECTOR(3 downto 0));
end divider;

architecture Behavioral of divider is
-- Signals
	signal temp1,temp2,temp3,temp4,temp5 : integer;
begin
	div_process : process(input)
	-- Variables
	variable n0,n1,n2,n3 : integer;
	begin
		n0 := conv_integer(unsigned(input));
		-- 1st digit
		temp1 <= n0 / 10000;
		n1 := n0 rem 10000;
		-- 2nd digit
		temp2 <= n1 / 1000;
		n2 := n1 rem 1000;
		-- 3rd digit
		temp3 <= n2 / 100;
		n3 := n2 rem 100;
		-- 4th digit
		temp4 <= n3 / 10;
		temp5 <= n3 rem 10;
	end process;
	d1 <= conv_std_logic_vector(temp1, d1'length);
	d2 <= conv_std_logic_vector(temp2, d2'length);
	d3 <= conv_std_logic_vector(temp3, d3'length);
	d4 <= conv_std_logic_vector(temp4, d4'length);
	d5 <= conv_std_logic_vector(temp5, d5'length);
	
end Behavioral;


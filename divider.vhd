library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity divider is
	port(input : in STD_LOGIC_VECTOR(15 downto 0);
			d1,d2,d3,d4,d5 : out STD_LOGIC_VECTOR(3 downto 0));
end divider;

architecture Behavioral of divider is
-- Signals
	signal temp_1,temp_2,temp_3,temp_4,temp_5 : STD_LOGIC_VECTOR(3 downto 0);
begin
	div_process : process(input)
	-- Variables
	variable n0,n1,n2,n3 : integer;
	variable temp1,temp2,temp3,temp4,temp5 : integer;
	begin
		n0 := to_integer(unsigned(input));
		-- 1st digit
		temp1 := (n0*2) / 10000;
		temp_1 <= std_logic_vector(to_unsigned(temp1, temp_1'length));
		temp_1 <= '0' & temp_1(3 downto 1);
		temp1 := to_integer(unsigned(temp_1));
		n1 := n0 - (temp1*10000);
		-- 2nd digit
		temp2 := (n1*2) / 1000;
		temp_2 <= std_logic_vector(to_unsigned(temp2, temp_2'length));
		temp_2 <= '0' & temp_2(3 downto 1);
		temp2 := to_integer(unsigned(temp_2));
		n2 := n1 - (temp2*1000);
		-- 3rd digit
		temp3 := (n2*2) / 100;
		temp_3 <= std_logic_vector(to_unsigned(temp3, temp_3'length));
		temp_3 <= '0' & temp_3(3 downto 1);
		temp3 := to_integer(unsigned(temp_3));
		n3 := n2 - (temp3*100);
		-- 4th digit
		temp4 := n3*2 / 10;
		temp_4 <= std_logic_vector(to_unsigned(temp4, temp_4'length));
		temp_4 <= '0' & temp_4(3 downto 1);
		temp4 := to_integer(unsigned(temp_4));
		-- 5th digit
		temp5 := n3 - (temp4*10);
		temp_5 <= std_logic_vector(to_unsigned(temp5, temp_5'length));
		
	end process;
	d1 <= temp_1;
	d2 <= temp_2;
	d3 <= temp_3;
	d4 <= temp_4;
	d5 <= temp_5;
	
end Behavioral;


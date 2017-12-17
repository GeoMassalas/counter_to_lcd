library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divider is
	port(input : in STD_LOGIC_VECTOR(15 downto 0);
			d1,d2,d3,d4,d5 : out STD_LOGIC_VECTOR(3 downto 0));
end divider;

architecture Behavioral of divider is
component alt_divider
	generic(divisor :integer := 10);
	port(divident : in STD_LOGIC_VECTOR(15 downto 0);
			quotient : out STD_LOGIC_VECTOR(3 downto 0);
			remainder : out STD_LOGIC_VECTOR(15 downto 0));
end component;
signal q1,q2,q3,q4 : STD_LOGIC_VECTOR(3 downto 0);
signal r1,r2,r3,r4 : STD_LOGIC_VECTOR(15 downto 0);
begin
	DIV1 : alt_divider 
		generic map( divisor => 10000)
		port map(divident => input, quotient => q1, remainder => r1);
	DIV2 : alt_divider 
		generic map( divisor => 1000)
		port map(divident => r1, quotient => q2, remainder => r2);
	DIV3 : alt_divider 
		generic map( divisor => 100)
		port map(divident => r2, quotient => q3, remainder => r3);
	DIV4 : alt_divider 
		generic map( divisor => 10)
		port map(divident => r3, quotient => q4, remainder => r4);
		d1 <= q1;
		d2 <= q2;
		d3 <= q3;
		d4 <= q4;
		d5 <= r4(3 downto 0);
	
end Behavioral;


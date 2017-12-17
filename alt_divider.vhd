library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alt_divider is
	generic(divisor :integer := 10);
	port(divident : in STD_LOGIC_VECTOR(15 downto 0);
			quotient : out STD_LOGIC_VECTOR(3 downto 0);
			remainder : out STD_LOGIC_VECTOR(15 downto 0));
end alt_divider;

architecture Behavioral of alt_divider is
signal q : STD_LOGIC_VECTOR(3 downto 0);
signal r : STD_LOGIC_VECTOR(15 downto 0);
begin
	div_process : process
		variable n : integer;
		variable temp : integer;
	begin
		temp := 0;
		n := to_integer(unsigned(divident));
		while n >= divisor loop
			temp := temp + 1;
			n := n - divisor;
		end loop;
		q <= std_logic_vector(to_unsigned(temp, quotient'length));
		r <= std_logic_vector(to_unsigned(n, remainder'length));
	end process;
	quotient <= q;
	remainder <= r;
end Behavioral;


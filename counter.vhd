
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity counter is
	port (clk,reset,funct : in STD_LOGIC;
			output : out STD_LOGIC_VECTOR(15 downto 0));
end counter;

architecture Behavioral of counter is
	signal temp : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
begin
	counter_process : process(clk,reset,funct)
		begin
			if clk'event and clk='1' and reset = '1' then
				temp <= "0000000000000000";
			elsif clk'event and clk='1' and funct = '0' then
				temp <= temp + '1';
			elsif clk'event and clk='1' and funct = '1' then
				temp <= temp - '1';
			end if;
		end process;
	output <= temp;
end Behavioral;


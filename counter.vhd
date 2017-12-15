
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
		if reset'event and reset = '1' then
			if funct = '0' then
				temp <= "0000000000000000";
			else
				temp <= "1111111111111111";
			end if;
		end if;
		if funct = '0' then
			temp <= temp + '1';
		else
			temp <= temp - '1';
		end if;
	end process;
	output <= temp;
end Behavioral;


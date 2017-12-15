
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
	counter_process : process(clk,reset,fucnt)
	begin
		if funct = '0' then
			if reset = '1' then
				temp <= (others =>0);
			else
				temp <= temp + '1';
			end if;
		else 
			if reset = '1' then
				temp <= (others =>1);
			else
				temp <= temp - '1';
			end if;
		end if;
	end process;
	output <= temp;
end Behavioral;


--
-- Counter Component increases when switch1 is
-- low decreases when switch 1 is high and resets
-- when the reset button is pressed
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity counter is
	port (clk,reset,funct : in STD_LOGIC;
			output : out STD_LOGIC_VECTOR(15 downto 0));
end counter;

architecture Behavioral of counter is
-- Signals
	signal temp : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
begin
	counter_process : process(clk,reset,funct)
		begin
			if clk'event and clk='1' then
				if reset = '1' then
					temp <= "0000000000000000";
				elsif funct = '0' then
					temp <= temp + '1';
				elsif funct = '1' then
					temp <= temp - '1';
				end if;
			end if;
		end process;
	output <= temp;
end Behavioral;


-- 
-- Component made in order to 
-- divide the 50Mhz on-board clock
-- to smaller frequency clocks where 
-- N is the number of repetitions
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity freq_div_u is
	generic (N:positive:=1);
	port(clk50 : in STD_LOGIC;
			clk : out STD_LOGIC);
end freq_div_u;

architecture Behavioral of freq_div_u is
-- Signals
signal temp : STD_LOGIC := '0';
signal i : integer := 0;

begin
	freqdiv : process(clk50) is
	begin
		if clk50'event and clk50='1' then
			i <= i+1;
			if (i = N) then  
				temp <= not temp;
				i <= 0;
			end if;
		end if;
	end process;
	clk <= temp;
end Behavioral;

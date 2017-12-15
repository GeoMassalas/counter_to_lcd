library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity freq_div_to_1 is
	port(clk50 : in STD_LOGIC;
			clk1 : out STD_LOGIC);
end freq_div_to_1;

architecture Behavioral of freq_div_to_1 is
signal temp : STD_LOGIC := '0';
signal i : integer := 0;
begin
	freqdiv : process(clk50) is
	begin
		if clk50'event and clk50='1' then
			i <= i+1;
			if (i = 25000000) then  
				temp <= not temp;
				i <= 0;
			end if;
		end if;
	end process;
	clk1 <= temp;
end Behavioral;

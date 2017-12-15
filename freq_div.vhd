--
-- Component takes as input the board's
-- 50 Mhz clock and outputs 4 other clocks
-- 1Hz , 10 Hz, 100 Hz, 1 Khz

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity freq_div is
	port( clk50 : in STD_LOGIC;
			clks : out STD_LOGIC_VECTOR(3 downto 0));
end freq_div;

architecture Behavioral of freq_div is
-- Frequency division component
	component freq_div_u
		generic (N:positive:=1);
		port(clk50 : in STD_LOGIC;
					clk : out STD_LOGIC);
	end component;
-- Signals
	signal O : STD_LOGIC_VECTOR(3 downto 0);
begin
	FD0:	freq_div_u 
		generic map(N=>25000000)
		port map(clk50,O(0)); -- 1hz
	FD1:	freq_div_u 
		generic map(N=>2500000)
		port map(clk50,O(1)); -- 10 hz
	FD2:	freq_div_u
		generic map(N=>250000)
		port map(clk50,O(2)); -- 100 hz
	FD3:	freq_div_u
		generic map(N=>25000)
		port map(clk50,O(3)); -- 1 Khz
	clks <= O;
end Behavioral;


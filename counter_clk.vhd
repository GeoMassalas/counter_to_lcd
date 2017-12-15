
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_clk is
	port(clk50,enable : in STD_LOGIC;
			sel : in STD_LOGIC_VECTOR(1 downto 0);
			clk : out STD_LOGIC);
end counter_clk;

architecture Behavioral of counter_clk is
	component freq_div
		port( clk50 : in STD_LOGIC;
				clks : out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	component mux_4_to_1
		port(sel : in STD_LOGIC_VECTOR(1 downto 0); -- sel(0)-switch2 / sel(1)-switch3
				enable : in STD_LOGIC; -- enable(sw0)
				D : in STD_LOGIC_VECTOR(3 downto 0);
				Y : out STD_LOGIC);
	end component;
	signal clks : STD_LOGIC_VECTOR(3 downto 0);
begin
	U1: freq_div
		port map(clk50 => clk50,clks => clks);
	U2: mux_4_to_1
		port map(sel => sel, enable => enable, D => clks, Y => clk);
end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity final_counter is
	port(clk50, reset : in STD_LOGIC;
			SW : in STD_LOGIC_VECTOR(3 downto 0);
			LED : out STD_LOGIC_VECTOR(7 downto 0));
end final_counter;

architecture Behavioral of final_counter is
-- Counter Clock Component
component counter_clk
	port(clk50,enable : in STD_LOGIC;
			sel : in STD_LOGIC_VECTOR(1 downto 0);
			clk : out STD_LOGIC);
end component;
-- Counter Component
component counter
	port (clk,reset,funct : in STD_LOGIC;
			output : out STD_LOGIC_VECTOR(15 downto 0));
end component;
-- Signals
signal main_clk : STD_LOGIC;
signal cnt_num : STD_LOGIC_VECTOR(15 downto 0);

begin
	CLOCK : counter_clk
		port map(clk50 => clk50, enable => SW(0), sel => SW(3 downto 2), clk => main_clk);
	CNTR : counter
		port map(clk => main_clk, reset => reset, funct => SW(1), output => cnt_num);
	LED <= cnt_num(7 downto 0);
end Behavioral;


entity freq_div is
	port( clk50 : in STD_LOGIC;
			clks : out STD_LOGIC_VECTOR(3 downto 0));
end freq_div;

architecture Behavioral of freq_div is
component freq_div_to_1
		port(clk50 : in STD_LOGIC;
				clk1 : out STD_LOGIC);
end component;
component freq_div_to_10
		port(clk50 : in STD_LOGIC;
				clks10 : out STD_LOGIC);
end component;
component freq_div_to_100
		port(clk50 : in STD_LOGIC;
				clks100 : out STD_LOGIC);
end component;
component freq_div_to_1000
		port(clk50 : in STD_LOGIC;
				clk1000 : out STD_LOGIC);
end component;
begin
FD0:	freq_div_to_1
	port map(clk50,clks(0));
FD1:	freq_div_to_10
	port map(clk50,clks(1));
FD2:	freq_div_to_100
	port map(clk50,clks(2));
FD3:	freq_div_to_1000
	port map(clk50,clks(3));


end Behavioral;


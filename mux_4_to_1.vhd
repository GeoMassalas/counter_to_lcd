library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_4_to_1 is
	port(sel : in STD_LOGIC_VECTOR(1 downto 0); -- sel(0)-switch2 / sel(1)-switch3
			enable : in STD_LOGIC; -- enable(sw0)
			D : in STD_LOGIC_VECTOR(3 downto 0);
			Y : out STD_LOGIC);
end mux_4_to_1;

architecture Behavioral of mux_4_to_1 is
begin
	Y <= '0' when enable = '1' else
			D(0) when sel = "00" else
			D(1) when sel = "01" else
			D(2) when sel = "11" else
			D(3) when sel = "10" ;
end Behavioral;


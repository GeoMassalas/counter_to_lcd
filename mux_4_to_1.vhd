library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_4_to_1 is
	port(sel : in STD_LOGIC_VECTOR(2 downto 0); -- sel(0)-enable(sw0) / sel(1)-switch2 / sel(2)-switch3 
			D : in STD_LOGIC_VECTOR(3 downto 0);
			Y : out STD_LOGIC);
end mux_4_to_1;

architecture Behavioral of mux_4_to_1 is

begin
	selection: process(sel)
	begin
		if sel(0) = '1' then
			Y <= '0';
		else
			case sel is
				when "000" => Y <= D(0);
				when "010" => Y <= D(1);
				when "100" => Y <= D(3);
				when "110" => Y <= D(2);
				when others => Y <= '0';
			end case;
		end if;
	end process;

end Behavioral;


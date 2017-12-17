library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity final_counter is
	port(clk50, reset : in STD_LOGIC;
			SW : in STD_LOGIC_VECTOR(3 downto 0);
			LED : out STD_LOGIC_VECTOR(7 downto 0);
			LCD_output : out STD_LOGIC_VECTOR(10 downto 0));
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
-- LCD Encoder Component
component LCD_encoder
	port(vector_in : in STD_LOGIC_VECTOR(15 downto 0);
			line1,line2 : out STD_LOGIC_VECTOR(127 downto 0));
end component;
-- LCD Driver Component
component lcd_controller
    port(clk        : IN    STD_LOGIC;  --system clock
		reset_n    : IN    STD_LOGIC;  --active low reinitializes lcd
		rw, rs, e  : OUT   STD_LOGIC;  --read/write, setup/data, and enable for lcd
		lcd_data   : OUT   STD_LOGIC_VECTOR(7 DOWNTO 0); --data signals for lcd
		line1_buffer : IN STD_LOGIC_VECTOR(127 downto 0); -- Data for the top line of the LCD
		line2_buffer : IN STD_LOGIC_VECTOR(127 downto 0)); -- Data for the bottom line of the LCD
end component;
-- Signals
signal main_clk : STD_LOGIC;
signal cnt_num : STD_LOGIC_VECTOR(15 downto 0);
signal line_1,line_2 : STD_LOGIC_VECTOR(127 downto 0);
signal LCD_temp : STD_LOGIC_VECTOR(10 downto 0); -- 7:0 --> lcd data / 8 rw / 9 rs / 10 e
begin
	CLOCK : counter_clk
		port map(clk50 => clk50, enable => SW(0), sel => SW(3 downto 2), clk => main_clk);
	CNTR : counter
		port map(clk => main_clk, reset => reset, funct => SW(1), output => cnt_num);
	LED <= cnt_num(7 downto 0);
	ENC : LCD_encoder
		port map(vector_in => cnt_num,line1 => line_1, line2 => line_2);
	DRIVER : lcd_controller
		port map(clk => clk50, reset_n => not(reset), rw => LCD_temp(8), rs => LCD_temp(9), e => LCD_temp(10), lcd_data => LCD_temp(7 downto 0), line1_buffer => line_1, line2_buffer => line_2);
	LCD_output <= LCD_temp;
end Behavioral;


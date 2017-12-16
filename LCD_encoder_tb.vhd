LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
 
ENTITY LCD_encoder_tb IS
END LCD_encoder_tb;
 
ARCHITECTURE behavior OF LCD_encoder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LCD_encoder
    PORT(
         vector_in : IN  std_logic_vector(15 downto 0);
         line1 : OUT  std_logic_vector(127 downto 0);
         line2 : OUT  std_logic_vector(127 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal vector_in : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal line1 : std_logic_vector(127 downto 0);
   signal line2 : std_logic_vector(127 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LCD_encoder PORT MAP (
          vector_in => vector_in,
          line1 => line1,
          line2 => line2
        );

   -- Clock process definitions
   clk_process :process
   begin
		vector_in <= vector_in + '1';
		wait for clk_period;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		

      wait;
   end process;

END;

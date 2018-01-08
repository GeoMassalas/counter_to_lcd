LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY freq_div_tb IS
END freq_div_tb;
 
ARCHITECTURE behavior OF freq_div_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT freq_div
    PORT(
         clk50 : IN  std_logic;
         clks : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk50 : std_logic := '0';

 	--Outputs
   signal clks : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk50_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: freq_div PORT MAP (
          clk50 => clk50,
          clks => clks
        );

   -- Clock process definitions
   clk50_process :process
   begin
		clk50 <= '0';
		wait for clk50_period/2;
		clk50 <= '1';
		wait for clk50_period/2;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		

      wait;
   end process;

END;

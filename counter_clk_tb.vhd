LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY counter_clk_tb IS
END counter_clk_tb;
 
ARCHITECTURE behavior OF counter_clk_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter_clk
    PORT(
         clk50 : IN  std_logic;
         enable : IN  std_logic;
         sel : IN  std_logic_vector(1 downto 0);
         clk : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk50 : std_logic := '0';
   signal enable : std_logic := '0';
   signal sel : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal clk : std_logic;

   -- Clock period definitions
   constant clk50_period : time := 20 ns;
	constant sel_period : time := 200 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter_clk PORT MAP (
          clk50 => clk50,
          enable => enable,
          sel => sel,
          clk => clk
        );

   -- Clock process definitions
   clk50_process :process
   begin
		clk50 <= '0';
		wait for clk50_period/2;
		clk50 <= '1';
		wait for clk50_period/2;
   end process;

	
	sel0_process :process
   begin
		sel(0) <= '0';
		wait for sel_period/4;
		sel(0) <= '1';
		wait for sel_period/4;
   end process;
	
	sel1_process :process
   begin
		sel(1) <= '0';
		wait for sel_period/2;
		sel(1) <= '1';
		wait for sel_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait;
   end process;

END;

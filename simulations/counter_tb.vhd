LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY counter_tb IS
END counter_tb;
 
ARCHITECTURE behavior OF counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         funct : IN  std_logic;
         output : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal funct : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter PORT MAP (
          clk => clk,
          reset => reset,
          funct => funct,
          output => output
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	funct_process :process
   begin
		funct <= '0';
		wait for 200 us;
		funct <= '1';
		wait for 200 us;
   end process;
	
	reset_process :process
   begin
		reset <= '0';
		wait for 300 us;
		reset <= '1';
		wait for 50 ns ;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		

      -- insert stimulus here 

      wait;
   end process;

END;

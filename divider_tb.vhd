LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
 
ENTITY divider_tb IS
END divider_tb;
 
ARCHITECTURE behavior OF divider_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT divider
    PORT(
         input : IN  std_logic_vector(15 downto 0);
         d1 : OUT  std_logic_vector(3 downto 0);
         d2 : OUT  std_logic_vector(3 downto 0);
         d3 : OUT  std_logic_vector(3 downto 0);
         d4 : OUT  std_logic_vector(3 downto 0);
			d5 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal d1 : std_logic_vector(3 downto 0);
   signal d2 : std_logic_vector(3 downto 0);
   signal d3 : std_logic_vector(3 downto 0);
   signal d4 : std_logic_vector(3 downto 0);
	signal d5 : std_logic_vector(3 downto 0);

	-- Clock 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: divider PORT MAP (
          input => input,
          d5 => d5,
          d1 => d1,
          d2 => d2,
          d3 => d3,
          d4 => d4
        );

   -- Clock process definitions
   clk_process :process
   begin
		input <= input + '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
      -- insert stimulus here 

      wait;
   end process;

END;

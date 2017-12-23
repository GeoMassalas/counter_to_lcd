LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY line1_encoder_tb IS
END line1_encoder_tb;
 
ARCHITECTURE behavior OF line1_encoder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT line1_encoder
    PORT(
         input : IN  std_logic_vector(15 downto 0);
         output : OUT  std_logic_vector(127 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(127 downto 0);

 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: line1_encoder PORT MAP (
          input => input,
          output => output
        );

   -- Clock process definitions
   clk_process0 :process
   begin
		input(3 downto 0) <= input(3 downto 0) + '1';
		wait for clk_period/2;
   end process;

   clk_process1 :process
   begin
		input(7 downto 4) <= input(7 downto 4) + '1';
		wait for clk_period/4;
   end process;

   clk_process2 :process
   begin
		input(11 downto 8) <= input(11 downto 8) + '1';
		wait for clk_period/8;
   end process;

   clk_process3 :process
   begin
		input(15 downto 12) <= input(15 downto 12) + '1';
		wait for clk_period/16;
   end process;

   -- Stimulus process
   stim_proc: process
   begin	
      wait;
   end process;

END;

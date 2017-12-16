LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL; 
 
ENTITY encoder_tb IS
END encoder_tb;
 
ARCHITECTURE behavior OF encoder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT encoder
    PORT(
         input : IN  std_logic_vector(3 downto 0);
         output : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant input_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: encoder PORT MAP (
          input => input,
          output => output
        );

   -- Clock process definitions
   input_process :process
   begin
		input <= input + '1';
		wait for input_period;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait;
   end process;

END;

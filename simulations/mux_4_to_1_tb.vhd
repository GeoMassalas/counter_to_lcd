
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY mux_4_to_1_tb IS
END mux_4_to_1_tb;
 
ARCHITECTURE behavior OF mux_4_to_1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_4_to_1
    PORT(
         sel : IN  std_logic_vector(1 downto 0);
         enable : IN  std_logic;
         D : IN  std_logic_vector(3 downto 0);
         Y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal sel : std_logic_vector(1 downto 0) := (others => '0');
   signal enable : std_logic := '0';
   signal D : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_4_to_1 PORT MAP (
          sel => sel,
          enable => enable,
          D => D,
          Y => Y
        );

  d0_process :process
   begin
		D(0) <= '0';
		wait for clk_period/8;
		D(0) <= '1';
		wait for clk_period/8;
   end process;
	
	d1_process :process
   begin
		D(1) <= '0';
		wait for clk_period/16;
		D(1) <= '1';
		wait for clk_period/16;
   end process;
	
	d2_process :process
   begin
		D(2) <= '0';
		wait for clk_period/32;
		D(2) <= '1';
		wait for clk_period/32;
   end process;
	
	d3_process :process
   begin
		D(3) <= '0';
		wait for clk_period/64;
		D(3) <= '1';
		wait for clk_period/64;
   end process;
	
	s0_process :process
   begin
		sel(0) <= '0';
		wait for clk_period/4;
		sel(0) <= '1';
		wait for clk_period/4;
   end process;
	
	s1_process :process
   begin
		sel(1) <= '0';
		wait for clk_period/2;
		sel(1) <= '1';
		wait for clk_period/2;
   end process;
	
	enable_process :process
	begin
		enable <= '0';
		wait for clk_period/10;
		enable <= '1';
		wait for clk_period/50;
	end process;
 

   -- Stimulus process
   stim_proc: process
   begin		


      -- insert stimulus here 

      wait;
   end process;

END;

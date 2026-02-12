
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY mod10counter_tb IS
END mod10counter_tb;
 
ARCHITECTURE behavior OF mod10counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mod10counter
    PORT(
         clk : IN  std_logic;
			rst : IN std_logic;
         count : OUT  std_logic_vector(3 downto 0)
			
        );
    END COMPONENT;
   
   --Inputs
   signal clk : std_logic := '0';
	signal rst : std_logic := '1';

 	--Outputs
   signal count : std_logic_vector(3 downto 0):="0000";

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mod10counter PORT MAP (
          clk => clk,
			 rst => rst,
          count => count
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		rst <= '0';
      wait;
   end process;

END;

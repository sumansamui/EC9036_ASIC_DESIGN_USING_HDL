--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:48:39 09/21/2021
-- Design Name:   
-- Module Name:   G:/codes/counter/counter3_tb.vhd
-- Project Name:  counter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter3
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY counter3_tb IS
END counter3_tb;
 
ARCHITECTURE behavior OF counter3_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter3
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         count : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';

 	--Outputs
   signal count : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter3 PORT MAP (
          clk => clk,
          reset => reset,
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

      reset <= '0';

      wait;
   end process;

END;

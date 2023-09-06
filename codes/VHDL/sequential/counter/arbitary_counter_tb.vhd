--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:46:13 09/22/2021
-- Design Name:   
-- Module Name:   G:/codes/counter/arbitary_counter_tb.vhd
-- Project Name:  counter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: arbitary_counter
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

 
ENTITY arbitary_counter_tb IS
END arbitary_counter_tb;
 
ARCHITECTURE behavior OF arbitary_counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT arbitary_counter
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         q : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';

 	--Outputs
   signal q : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: arbitary_counter PORT MAP (
          clk => clk,
          reset => reset,
          q => q
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

      --wait for clk_period*10;

      -- insert stimulus here 
		reset<='0'; 
      wait;
   end process;

END;

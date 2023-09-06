--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:00:11 10/19/2021
-- Design Name:   
-- Module Name:   G:/codes/lab3/arbitary_seq_counter_tb.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: arbitary_seq_counter
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY arbitary_seq_counter_tb IS
END arbitary_seq_counter_tb;
 
ARCHITECTURE behavior OF arbitary_seq_counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT arbitary_seq_counter
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         count : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '1';

 	--Outputs
   signal count : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: arbitary_seq_counter PORT MAP (
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

      -- insert stimulus here 
		rst<='0';
      wait;
   end process;

END;

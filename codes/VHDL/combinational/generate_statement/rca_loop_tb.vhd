--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:24:57 09/23/2021
-- Design Name:   
-- Module Name:   G:/codes/generate_statements/rca_loop_tb.vhd
-- Project Name:  generate_statements
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: rca_loop
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
 
ENTITY rca_loop_tb IS
END rca_loop_tb;
 
ARCHITECTURE behavior OF rca_loop_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rca_loop
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         sum : OUT  std_logic_vector(3 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal cin : std_logic := '0';

 	--Outputs
   signal sum : std_logic_vector(3 downto 0);
   signal cout : std_logic;
   constant period: time := 100 ns;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rca_loop PORT MAP (
          a => a,
          b => b,
          cin => cin,
          sum => sum,
          cout => cout
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		a <= "0001"; b <= "1111";
		wait for period;

		a <= "0010"; b <= "1110";
		wait for period;

		a <= "0011"; b <= "1100";
		wait for period;

		wait; -- indefinitely suspend process
  end process;

END;

--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:32:19 10/19/2021
-- Design Name:   
-- Module Name:   G:/codes/lab3/binary_to_gray_converter_tb.vhd
-- Project Name:  lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: binary_to_gray_converter
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

 
ENTITY binary_to_gray_converter_tb IS
END binary_to_gray_converter_tb;
 
ARCHITECTURE behavior OF binary_to_gray_converter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT binary_to_gray_converter
    PORT(
         b : IN  std_logic_vector(2 downto 0);
         g : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal b : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal g : std_logic_vector(2 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: binary_to_gray_converter PORT MAP (
          b => b,
          g => g
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		-- insert stimulus here
		
		b<="001";
		wait for 100 ns;
		b<="010";
		wait for 100 ns;
		b<="011";
		wait for 100 ns;
		b<="100";
		wait for 100 ns;
		b<="101";
		wait for 100 ns;
		b<="110";
		wait for 100 ns;
		b<="111";
		wait for 100 ns;
       

      wait;
   end process;

END;

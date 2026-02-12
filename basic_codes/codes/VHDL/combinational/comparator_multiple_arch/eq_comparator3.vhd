----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:02:01 08/23/2021 
-- Design Name: 
-- Module Name:    eq_comparator3 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity eq_comparator3 is
    Port ( a : in  STD_LOGIC_VECTOR (1 downto 0);
           b : in  STD_LOGIC_VECTOR (1 downto 0);
           y : out  STD_LOGIC);
end eq_comparator3;

architecture Behavioral of eq_comparator3 is

begin
proc1: process(a,b)
begin
	if (a=b) then
		y<='1';
	else
		y<='0';
	end if; 
end process;
end Behavioral;


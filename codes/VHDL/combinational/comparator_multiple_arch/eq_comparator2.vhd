----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:53:51 08/23/2021 
-- Design Name: 
-- Module Name:    eq_comparator2 - dataflow2 
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


entity eq_comparator2 is
    Port ( a : in  STD_LOGIC_VECTOR (1 downto 0);
           b : in  STD_LOGIC_VECTOR (1 downto 0);
           y : out  STD_LOGIC);
end eq_comparator2;

architecture dataflow2 of eq_comparator2 is

begin
y <= (a(1) xnor b(1))and(a(0) xnor b(0));
end dataflow2;


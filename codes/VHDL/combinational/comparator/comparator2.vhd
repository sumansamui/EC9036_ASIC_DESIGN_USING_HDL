----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:50:19 09/17/2021 
-- Design Name: 
-- Module Name:    comparator2 - Behavioral 
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

entity comparator2 is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           g : out  STD_LOGIC;
           e : out  STD_LOGIC;
           l : out  STD_LOGIC);
end comparator2;

architecture Behavioral of comparator2 is

begin
g<= '1' when (a>b) else '0';
e<= '1' when (a=b) else '0';
l<= '1' when (a<b) else '0';
end Behavioral;


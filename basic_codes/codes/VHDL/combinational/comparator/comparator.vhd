----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:35:45 09/17/2021 
-- Design Name: 
-- Module Name:    comparator - Behavioral 
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


entity comparator is
	 Generic (N: natural:=8); 	
    Port ( a : in  STD_LOGIC_VECTOR (N-1 downto 0);
           b : in  STD_LOGIC_VECTOR (N-1 downto 0);
           g : out  STD_LOGIC;
           e : out  STD_LOGIC;
           l : out  STD_LOGIC);
end comparator;

architecture Behavioral of comparator is

begin
process(a,b)
begin
	if (a>b) then
		g<='1'; e<='0'; l<='0';
	elsif (a=b) then
		g<='0'; e<='1'; l<='0';
	elsif (a<b) then 
		g<='0'; e<='0'; l<='1';
	else 
		g<='X';e<='X';l<='X';
	end if;
end process;
end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:04:58 09/21/2021 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           count : buffer STD_LOGIC_VECTOR (3 downto 0));
end counter;

architecture Behavioral of counter is       
signal temp_count: STD_LOGIC(3 downto 0);
begin
process(clk,reset)
begin
	if (reset = '1') then
		  temp_count <= "0000";		   		   
	elsif (rising_edge(clk)) then
		temp_count <= temp_count+1;	
	end if;
end process;
count<=temp;
end Behavioral;
-----------------------------------------------------------------------------------


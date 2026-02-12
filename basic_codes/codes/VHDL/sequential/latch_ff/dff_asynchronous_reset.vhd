----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:20:55 09/15/2021 
-- Design Name: 
-- Module Name:    dff_asynchronous_reset - Behavioral 
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

entity dff_asynchronous_reset is
    Port ( d : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           q : out  STD_LOGIC);
end dff_asynchronous_reset;

architecture Behavioral of dff_asynchronous_reset is
begin
process(clk,reset)
begin
	if (reset='1') then
		q<='0';
	elsif (rising_edge(clk)) then
		q<=d;
	end if;
end process;
end Behavioral;
-----------------------------------------------------------------------------------

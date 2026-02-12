----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:48:19 09/15/2021 
-- Design Name: 
-- Module Name:    dff_synchronous_reset - Behavioral 
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

entity dff_synchronous_reset is
    Port ( d : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           q : out  STD_LOGIC);
end dff_synchronous_reset;

architecture Behavioral of dff_synchronous_reset is
begin
process(clk)
begin	
	if (rising_edge(clk)) then
		if (reset='1') then 
			q<='0';
		else	
			q<=d;
		end if;
   end if;		
end process;
end Behavioral;
------------------------------------------------------------------------------------

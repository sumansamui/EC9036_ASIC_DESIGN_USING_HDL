----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:36:53 09/15/2021 
-- Design Name: 
-- Module Name:    dlatch - Behavioral 
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

entity dlatch is
    Port ( d : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
	       q: out STD_LOGIC);
end dlatch;

architecture Behavioral of dlatch is
             
begin
process(d,reset,clk)
begin	
	if (clk='1') then
		if (reset='1') then 
			q<='0';
		else	
			q<=d;
		end if;
   end if;		
end process;
end Behavioral;
--------------------------------------------------------------------------------------

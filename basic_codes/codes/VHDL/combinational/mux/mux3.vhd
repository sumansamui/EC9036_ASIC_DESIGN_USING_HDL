----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:33:45 09/10/2021 
-- Design Name: 
-- Module Name:    mux3 - sequential 
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
entity mux3 is
    Port ( x1 : in  STD_LOGIC_VECTOR (3 downto 0);
           x2 : in  STD_LOGIC_VECTOR (3 downto 0);
           x3 : in  STD_LOGIC_VECTOR (3 downto 0);
           x4 : in  STD_LOGIC_VECTOR (3 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           y : out  STD_LOGIC_VECTOR (3 downto 0));
end mux3;

architecture sequential1 of mux3 is
begin
process(x1,x2,x3,x4,sel)
begin
if sel="00" then
	y<=x1;
elsif sel="01" then
	y<=x2;
elsif sel="10" then
	y<=x3; 
elsif sel="11" then
	y<=x4;
else 
   y<="XXXX";
end if;	
end process;  
end sequential1;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:48:27 09/10/2021 
-- Design Name: 
-- Module Name:    mux4 - sequemtial2 
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
entity mux4 is
    Port ( x1 : in  STD_LOGIC_VECTOR (3 downto 0);
           x2 : in  STD_LOGIC_VECTOR (3 downto 0);
           x3 : in  STD_LOGIC_VECTOR (3 downto 0);
           x4 : in  STD_LOGIC_VECTOR (3 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           y : out  STD_LOGIC_VECTOR (3 downto 0));
end mux4;

architecture sequential2 of mux4 is
begin
process(x1,x2,x3,x4,sel)
begin
case sel is
	when "00" => y<=x1;
 	when "01" => y<=x2;
	when "10" => y<=x3;
	when "11" => y<=x4;
	when others => y<="XXXX";
end case;
end process;  
end sequential2;


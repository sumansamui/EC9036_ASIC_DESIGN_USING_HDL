----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:40:43 09/22/2021 
-- Design Name: 
-- Module Name:    rca_loop - Behavioral 
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

entity rca_loop is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (7 downto 0);
           cout : out  STD_LOGIC);
end rca_loop;

architecture Behavioral of rca_loop is
begin
process(a,b,cin)
variable c: std_logic_vector(8 downto 0);
begin
c(0):=cin;
for i in 0 to 7 loop
	sum(i)<=a(i) xor b(i) xor c(i);
	c(i+1):=(a(i) and b(i))or(b(i) and c(i))or(c(i) and a(i));
end loop;
cout<=c(8);
end process;
end Behavioral;
------------------------------------------------------------------------------------

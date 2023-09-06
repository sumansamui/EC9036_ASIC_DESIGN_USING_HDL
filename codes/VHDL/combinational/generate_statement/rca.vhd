----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:28:30 09/13/2021 
-- Design Name: 
-- Module Name:    rca - Behavioral 
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

entity rca is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (7 downto 0);
           cout : out  STD_LOGIC);
end rca;

architecture generate_beq of rca is
signal c: std_logic_vector(8 downto 0); 
begin
c(0)<=cin;
gen: for i in 0 to 7 generate
			sum(i)<=a(i) xor b(i) xor c(i);
			c(i+1)<=(a(i) and b(i))or(b(i) and c(i))or(c(i) and a(i));
end generate;
cout<=c(8);	
end generate_beq;


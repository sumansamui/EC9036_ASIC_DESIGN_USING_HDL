----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:37:17 10/02/2021 
-- Design Name: 
-- Module Name:    circuit - Behavioral 
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

entity circuit is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           y : out  STD_LOGIC);
end circuit;

architecture Behavioral of circuit is
signal temp: std_logic;
begin
process(clk,rst)
begin
if rst='1' then
	temp<='0';
elsif rising_edge(clk) then 
	if sel='1' then
		temp<=b xor a;
	else
		temp<=temp xor a;
	end if;	
end if;	
end process;
y<=temp;
end Behavioral;


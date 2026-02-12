----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:44:25 09/21/2021 
-- Design Name: 
-- Module Name:    counter3 - Behavioral 
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
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all;

entity counter3 is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           count : out STD_LOGIC_VECTOR (3 downto 0));
end counter3;

architecture Behavioral of counter3 is
begin
process(clk,reset)
variable tmp_count: std_logic_vector(3 downto 0);
begin
	if (reset = '1') then
		tmp_count := (others=>'0');
	elsif (rising_edge(clk)) then
		tmp_count := tmp_count+1;	
	end if;
count<=tmp_count;
end process;
end Behavioral;
-----------------------------------------------------------------------------------


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:16:51 09/22/2021 
-- Design Name: 
-- Module Name:    arbitary_counter - Behavioral 
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

entity arbitary_counter is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (2 downto 0));
end arbitary_counter;

architecture Behavioral of arbitary_counter is
signal present_state: std_logic_vector(2 downto 0);
signal next_state: std_logic_vector(2 downto 0);
begin
process(clk,reset)
begin
if (reset='1') then
	present_state<="000";
elsif (rising_edge(clk)) then
	present_state<=next_state;	
end if;
end process;
process(present_state)
begin
case present_state is
	when "000" => next_state<="010";
	when "010" => next_state<="100";
	when "100" => next_state<="110";
	when "110" => next_state<="000";
	when others => "XXX";
end case;
end process;
q<=present_state;
end Behavioral;
--------------------------------------------------------------------------------

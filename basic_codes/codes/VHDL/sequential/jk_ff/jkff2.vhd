----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:39:55 09/17/2021 
-- Design Name: 
-- Module Name:    jkff2 - Behavioral 
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

entity jkff2 is
    Port ( j : in  STD_LOGIC;
           k : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           q : out  STD_LOGIC;
           q_b: out STD_LOGIC);
end jkff2;

architecture Behavioral of jkff2 is
signal input: std_logic_vector(1 downto 0);
signal q_state: std_logic; 
begin
input<=j & k;
process(clk,reset)
begin
	if (reset='1') then
		q_state<='0';
	elsif (rising_edge(clk)) then	
		case input is
			when "01" => q_state<='0';
			when "10" => q_state<='1';
			when "11" => q_state<=not q_state;
		end case;
	end if;
end process;
q<=q_state;    
q_b<=not q_state;
end Behavioral;
------------------------------------------------------------------------------------
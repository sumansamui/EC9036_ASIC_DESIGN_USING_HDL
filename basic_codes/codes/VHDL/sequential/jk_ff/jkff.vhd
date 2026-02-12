----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:12:53 09/17/2021 
-- Design Name: 
-- Module Name:    jkff - Behavioral 
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

entity jkff is
    Port (j : in  STD_LOGIC;
           k : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           q : out STD_LOGIC;
           qb: out STD_LOGIC);
end jkff;

architecture Behavioral of jkff is
signal q_state: std_logic;
begin
process(clk,reset)
begin
	if (reset='1') then
		q_state<='0';
	elsif (rising_edge(clk)) then
		if	(j='0' and k='1') then
			q_state<='0';
		elsif	(j='1' and k='0') then
			q_state<='1';
		elsif (j='1' and k='1') then
			q_state<=not q_state;
		end if;
	end if;	
end process;
q<=q_state; 
qb<=not q_state; 
end Behavioral;


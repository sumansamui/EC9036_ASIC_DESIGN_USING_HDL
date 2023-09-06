library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all;

entity counter_fsm is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           count : out STD_LOGIC_VECTOR (3 downto 0));
end counter_fsm;

architecture Behavioral of counter_fsm is       
signal ps,ns: STD_LOGIC(3 downto 0);
begin
process(clk,reset)
begin
	if (reset = '1') then
		ps <= "0000";		   		   
	elsif (rising_edge(clk)) then
		ps <= ns;	
	end if;
end process;
process(ps)
begin
ns<=ps+1;
end process;
count<=ps;
end Behavioral;
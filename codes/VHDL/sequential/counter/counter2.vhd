
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all;

entity counter2 is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           count : out STD_LOGIC_VECTOR (31 downto 0));
end counter2;

architecture Behavioral of counter2 is
signal tmp_count: std_logic_vector(31 downto 0);
begin
process(clk,reset)
begin
	if (reset = '1') then
		tmp_count <= (others=>'0');
	elsif (rising_edge(clk)) then
		tmp_count <= tmp_count+1;	
	end if;
end process;
count<=tmp_count;
end Behavioral;


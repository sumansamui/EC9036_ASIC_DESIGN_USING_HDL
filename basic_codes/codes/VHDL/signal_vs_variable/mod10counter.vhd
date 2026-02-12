library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity mod10counter is
    Port (clk : in  STD_LOGIC;
			 rst : in STD_LOGIC;
          count : out  STD_LOGIC_VECTOR(3 downto 0));
end mod10counter;

architecture Behavioral of mod10counter is
signal tmp: std_logic_vector(3 downto 0);  
begin
process(clk,rst)
begin
if rst='1' then
	tmp<="0000";
elsif (rising_edge(clk)) then
	tmp<=tmp+1;
	if tmp="1010" then
		tmp<="0000";
	end if;
end if;
end process;
count<=tmp;
end Behavioral;




















architecture Behavioral of mod10counter is 
begin
process(clk,rst)
variable tmp: std_logic_vector(3 downto 0); 
begin
if rst='1' then
tmp:="0000";
elsif (rising_edge(clk)) then
tmp:=tmp+1;
if tmp="1010" then
tmp:="0000";
end if;
end if;
count<=tmp;
end process;
end Behavioral;

--

--configuration which_arch of mod10counter is
--	for Behavioral
--	end for;
--end configuration;
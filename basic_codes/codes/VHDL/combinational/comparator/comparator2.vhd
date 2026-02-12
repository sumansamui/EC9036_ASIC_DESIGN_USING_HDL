
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator2 is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           g : out  STD_LOGIC;
           e : out  STD_LOGIC;
           l : out  STD_LOGIC);
end comparator2;

architecture Behavioral of comparator2 is

begin
g<= '1' when (a>b) else '0';
e<= '1' when (a=b) else '0';
l<= '1' when (a<b) else '0';
end Behavioral;


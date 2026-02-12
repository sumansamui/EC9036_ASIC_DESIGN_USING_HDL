library ieee;
use ieee.std_logic_1164.all;

entity prio_enco is
port (en: in std_logic;
a_in: in std_logic_vector (7 downto 0);
y_op: out std_logic_vector (2 downto 0));
end prio_enco;     

architecture behaviorial of prio_enco is
begin
y_op<="111" when a_in(7)='1' else
	  "110" when a_in(6)='1' else
      "101" when a_in(5)='1' else
      "100" when a_in(4)='1' else
      "011" when a_in(3)='1' else
      "010" when a_in(2)='1' else
      "001" when a_in(1)='1' else
      "000" when a_in(0)='1' else
      "XXX";
end;
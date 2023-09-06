library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logic_ckt_arbitary_seq_counter is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           count : out  STD_LOGIC_VECTOR (3 downto 0);
		   y: out std_logic);
end logic_ckt_arbitary_seq_counter;

architecture Behavioral of logic_ckt_arbitary_seq_counter is
signal present_state,next_state: std_logic_vector(3 downto 0); 
begin
process(clk,rst)
begin
if rst='1' then
	present_state<=(others=>'0');
elsif rising_edge(clk) then
	present_state<=next_state;
end if;
end process;
process(present_state)
begin
if present_state="0000" then
	next_state<="0010";
elsif present_state="0010" then
	next_state<="0101"; 
elsif present_state="0101" then
	next_state<="1001"; 	
elsif present_state="1001" then
	next_state<="1110";
elsif present_state="1110" then
	next_state<="0000";         
else
	next_state<="XXXX"; 

end if;	
end process;
count<=present_state;   
msb<=present_state(3);
lsb<=present_state(0);
process(msb,lsb)
begin
if msb /= lsb then
y<='1';
elsif msb=lsb then
y<='0'
else
y<='X'	 
end if;
end process;
end Behavioral;


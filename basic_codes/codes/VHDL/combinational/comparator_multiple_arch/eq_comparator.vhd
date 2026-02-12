----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:49:15 08/23/2021 
-- Design Name: 
-- Module Name:    eq_comparator - Behavioral 
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
--libraries to be used are specified here
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--entity declaration with port definitions
entity compare is
port(num1 : in std_logic_vector(3 downto 0);  --input 1
     num2 :      in std_logic_vector(3 downto 0);  --input 2
     less :              out std_logic;   -- indicates first number is small
           equal :          out std_logic;   -- both are equal
           greater :   out std_logic    -- indicates first number is bigger
);
end compare;

--architecture of entity
architecture Behavioral of compare is

begin
process(num1,num2)
begin    -- process starts with a 'begin' statement
if (num1 > num2 ) then  --checking whether num1 is greater than num2
less <= '0';
equal <= '0';
greater <= '1';
elsif (num1 < num2) then    --checking whether num1 is less than num2
less <= '1';
equal <= '0';
greater <= '0';
else     --checking whether num1 is equal to num2
less <= '0';
equal <= '1';
greater <= '0';
end if;
end process;   -- process ends with a 'end process' statement

end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:29:40 08/15/2021 
-- Design Name: 
-- Module Name:    full_adder2 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder2 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end full_adder2;
architecture arch2 of full_adder2 is
signal input: std_logic_vector (2 downto 0);
signal output: std_logic_vector (1 downto 0);
begin
input <=a & b &cin;
sum <= output(1);
cout <= output(0);
with input select
output <= "00" when "000",
			 "10" when "001",
			 "10" when "010",
			 "01" when "011",
			 "10" when "100",
			 "01" when "101",
          "01" when "110",
          "11" when "111",
			 "XX" when others;
end arch2;


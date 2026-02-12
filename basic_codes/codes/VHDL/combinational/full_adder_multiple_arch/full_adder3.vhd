----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:06:47 08/16/2021 
-- Design Name: 
-- Module Name:    full_adder3 - arch3 
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


entity full_adder3 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end full_adder3;

architecture arch3 of full_adder3 is
COMPONENT half_adder
	PORT(x,y : IN std_logic;          
		  u,v : OUT std_logic);
	END COMPONENT;
COMPONENT orgate
	PORT(x,y : IN std_logic;          
		   z: OUT std_logic);
	END COMPONENT;	
signal s1,c1,c2: STD_LOGIC; 	
begin

ha1: half_adder port map(a,b,s1,c1);
ha2: half_adder port map(s1,cin,sum,c2);
orgate1: orgate port map(c1,c2,cout);
end arch3;


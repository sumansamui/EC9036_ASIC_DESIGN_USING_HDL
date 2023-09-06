----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:15:07 08/30/2021 
-- Design Name: 
-- Module Name:    equality_comparator - structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
---------------------------------------------------------------------------------
entity equality_comparator is
    Port ( a : in  STD_LOGIC_VECTOR (1 downto 0);
           b : in  STD_LOGIC_VECTOR (1 downto 0);
           y : out  STD_LOGIC);
end equality_comparator;
---------------------------------------------------------------------------------
architecture structural of equality_comparator is
-- arch. declaration part
-- component declaration 
component xnorgate2
port(i1,i2: in std_logic; o1: out std_logic);
end component;
component andgate2
port(i1,i2: in std_logic; o1: out std_logic);
end component;
-- signal declaration
signal int1,int2: std_logic; 
-- arch. statement part
begin
c1: xnorgate2 port map(a(1),b(1),int1);
c2: xnorgate2 port map(a(0),b(0),int2);
c3: andgate2 port map (int1,int2,y);
end structural;
-----------------------------------------------------------------------------------

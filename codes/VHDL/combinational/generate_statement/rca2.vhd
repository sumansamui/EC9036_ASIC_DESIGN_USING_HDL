----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:02:57 09/13/2021 
-- Design Name: 
-- Module Name:    rca2 - Behavioral 
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

entity rca2 is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (7 downto 0);
           cout : out  STD_LOGIC);
end rca2;

architecture generate_components of rca2 is
component fa 
	port(x,y,z: in std_logic; s,c: out std_logic);
end component;
signal carry: std_logic_vector(8 downto 0);
begin
carry(0)<=cin;
gen_loop: for i in 0 to 7 generate
c1:fa port map(a(i),b(i),carry(i),sum(i),carry(i+1));
end generate;
cout<=carry(8);
end generate_components;


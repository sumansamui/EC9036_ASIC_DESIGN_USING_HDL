----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:08:00 09/13/2021 
-- Design Name: 
-- Module Name:    fa - arch_beq 
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

entity fa is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           s : out  STD_LOGIC;
           co : out  STD_LOGIC);
end fa;

architecture arch_beq of fa is

begin
s<=a xor b xor c;
co<=(a and b)or(b and c)or(c and a);
end arch_beq;


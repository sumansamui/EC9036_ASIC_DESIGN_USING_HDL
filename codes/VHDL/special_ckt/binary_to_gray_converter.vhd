----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:26:32 10/19/2021 
-- Design Name: 
-- Module Name:    binary_to_gray_converter - Behavioral 
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

entity binary_to_gray_converter is
    Port ( b : in  STD_LOGIC_VECTOR (2 downto 0);
           g : out  STD_LOGIC_VECTOR (2 downto 0));
end binary_to_gray_converter;

architecture Behavioral of binary_to_gray_converter is
begin
g(0)<=b(0);
gen_loop: for i in 1 to 2 generate
				  g(i)<=b(i) xor b(i-1);
end generate;				  
end Behavioral;


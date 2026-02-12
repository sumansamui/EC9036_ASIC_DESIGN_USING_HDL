library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;  -- For arithmetic on std_logic_vector

entity clock_divider is
    Port ( clk_in  : in  STD_LOGIC;  -- Input clock
           reset   : in  STD_LOGIC;  -- Reset signal
           clk_out : out STD_LOGIC   -- Divided clock output
         );
end clock_divider;

architecture Behavioral of clock_divider is
    signal count : STD_LOGIC_VECTOR(2 downto 0) := "000";  -- 3-bit counter (0 to 4)
    signal clk_int : STD_LOGIC := '0';                      -- Internal clock signal
begin
    process (clk_in, reset)
    begin
        if reset = '1' then
            count <= "000";
            clk_int <= '0';
        elsif rising_edge(clk_in) then
            if count = "100" then  -- 5 cycles (when count = 4 in decimal)
                clk_int <= not clk_int; -- Toggle clock
                count <= "000";         -- Reset counter
            else
                count <= count + 1;     -- Increment counter
            end if;
        end if;
    end process;

    clk_out <= clk_int;  -- Output the divided clock
end Behavioral;

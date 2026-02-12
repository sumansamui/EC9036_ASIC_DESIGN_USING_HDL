library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ring_Counter_Right_Shift is
    Port (
        clk    : in  STD_LOGIC;        -- Clock signal
        rst    : in  STD_LOGIC;        -- Asynchronous reset
        count  : out STD_LOGIC_VECTOR(3 downto 0) -- Output of the ring counter
    );
end Ring_Counter_Right_Shift;

architecture Behavioral of Ring_Counter_Right_Shift is
    signal shift_reg : STD_LOGIC_VECTOR(3 downto 0) := "0001"; -- Initialize with one bit set
begin
    process(clk, rst)
    begin
        if rst = '1' then
            -- Asynchronous reset: initialize the register
            shift_reg <= "0001";
        elsif rising_edge(clk) then
            -- Shift right and wrap around
            shift_reg <= shift_reg(0) & shift_reg(3 downto 1);
        end if;
    end process;

    -- Output the current state of the ring counter
    count <= shift_reg;
end Behavioral;  


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Johnson_Counter is
    Port (
        clk    : in  STD_LOGIC;        -- Clock signal
        rst    : in  STD_LOGIC;        -- Asynchronous reset
        count  : out STD_LOGIC_VECTOR(3 downto 0) -- Output of the Johnson counter
    );
end Johnson_Counter;

architecture Behavioral of Johnson_Counter is
    signal shift_reg : STD_LOGIC_VECTOR(3 downto 0) := "0000"; -- Initialize to all zeros
begin
    process(clk, rst)
    begin
        if rst = '1' then
            -- Asynchronous reset: initialize the register
            shift_reg <= "0000";
        elsif rising_edge(clk) then
            -- Johnson counter logic: invert the last bit and shift left
            shift_reg <= shift_reg(2 downto 0) & not shift_reg(3);
        end if;
    end process;

    -- Output the current state of the Johnson counter
    count <= shift_reg;
end Behavioral;


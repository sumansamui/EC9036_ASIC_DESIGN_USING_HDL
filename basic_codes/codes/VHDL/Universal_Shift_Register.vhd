library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Universal_Shift_Register is
    Port (
        clk       : in  STD_LOGIC;        -- Clock
        rst       : in  STD_LOGIC;        -- Asynchronous Reset
        load      : in  STD_LOGIC;        -- Parallel Load Enable
        shift_left: in  STD_LOGIC;        -- Shift Left Enable
        shift_right: in STD_LOGIC;        -- Shift Right Enable
        data_in   : in  STD_LOGIC_VECTOR(3 downto 0);  -- Parallel Data Input
        reg_out   : out STD_LOGIC_VECTOR(3 downto 0)   -- Register Output
    );
end Universal_Shift_Register;

architecture Behavioral of Universal_Shift_Register is
    signal shift_reg : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
begin
    process(clk, rst)
    begin
        if rst = '1' then
            -- Asynchronous reset
            shift_reg <= (others => '0');
        elsif rising_edge(clk) then
            if load = '1' then
                -- Parallel Load
                shift_reg <= data_in;
            elsif shift_left = '1' then
                -- Shift Left
                shift_reg <= shift_reg(2 downto 0) & '0';
            elsif shift_right = '1' then
                -- Shift Right
                shift_reg <= '0' & shift_reg(3 downto 1);
            end if;
        end if;
    end process;

    -- Output the current state of the shift register
    reg_out <= shift_reg;
end Behavioral;

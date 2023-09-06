LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY comparator_tb IS
END comparator_tb;
 
ARCHITECTURE behaviour_tb OF comparator_tb IS 
 
-- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT comparator
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         g : OUT  std_logic;
         e : OUT  std_logic;
         l : OUT  std_logic
        );
    END COMPONENT;
   -- Declare the signals
   --Inputs
   signal a : std_logic_vector(3 downto 0);
   signal b : std_logic_vector(3 downto 0);

 	--Outputs
   signal g : std_logic;
   signal e : std_logic;
   signal l : std_logic;
 
BEGIN


-- Instantiate the DUT/UUT
dut: comparator PORT MAP (a, b, g, e,l);
--dut: comparator PORT MAP (a => a, b => b, g => g, e => e,l => l);


-- Apply Stimulus
process
begin
a<="1100"; b<="0001";
wait for 200 ns;

a<="1001"; b<="1001";
wait for 200 ns;

a<="1000"; b<="1111";
wait for 200 ns;

--likewise you may write all the possible input combinations

wait; --suspend the process indefinitely
end process;
END behaviour_tb;

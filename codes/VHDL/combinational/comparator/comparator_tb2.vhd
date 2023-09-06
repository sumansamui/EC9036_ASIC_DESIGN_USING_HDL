LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY comparator_tb2 IS
END comparator_tb2;
 
ARCHITECTURE behaviour_tb2 OF comparator_tb2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT) / Device Under Test (DUT)
 
    COMPONENT comparator
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         g : OUT  std_logic;
         e : OUT  std_logic;
         l : OUT  std_logic
        );
    END COMPONENT;
    
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
a <= "1100", "1001" after 200 ns, "1000" after 400 ns;
b <= "0001", "1001" after 200 ns, "1111" after 400 ns;


END behaviour_tb2;


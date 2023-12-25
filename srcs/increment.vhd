library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity increment is
    port(   A       :   in std_logic_vector(3 downto 0);        
            B       :   out std_logic_vector(3 downto 0)
            );
end increment;

architecture Behavioral of increment is
begin
    incrementer: process(A) -- Include A in sensitivity list
    begin
        if A /= "1111" then  -- Check for "1111" instead of "0000"
            B <= std_logic_vector(unsigned(A) + 1);
            
        else
            B <= "0000";  -- Wrap around if A = "1111"
            
        end if;
    end process;
end Behavioral;


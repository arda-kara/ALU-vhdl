library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity left_rotator is
    port(   A   :   in std_logic_vector(3 downto 0);
            B   :   out std_logic_vector(3 downto 0)
            );
end left_rotator;

architecture Behavioral of left_rotator is
begin
    rotate: process(A)  -- Include A in sensitivity list
    begin
        B(0) <= A(3);
        B(1) <= A(0); 
        B(2) <= A(1); 
        B(3) <= A(2);  
    end process;
end Behavioral;


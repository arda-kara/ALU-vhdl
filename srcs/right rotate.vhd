library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity right_rotator is
    port(   A   :   in std_logic_vector(3 downto 0);
            B   :   out std_logic_vector(3 downto 0)
            );
end right_rotator;

architecture Behavioral of right_rotator is
begin
    shift: process(A)  -- Include A in sensitivity list
    begin
        B(3) <= A(0);
        B(2) <= A(3); 
        B(1) <= A(2); 
        B(0) <= A(1);  
    end process;
end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;




entity decrement is
    port(   A       :   in std_logic_vector(3 downto 0);
            B       :   out std_logic_vector(3 downto 0)
            );
end decrement;

architecture Behavioral of decrement is
begin
    decrementer: process(A)
    begin
        if A /= "1111" then
            B <= std_logic_vector(unsigned(A) - 1);
        else
            B <= A;
        end if;
    end process;
end Behavioral;

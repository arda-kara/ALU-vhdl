library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity left_shifter is
    port(   A   :   in std_logic_vector(3 downto 0);
            B   :   out std_logic_vector(3 downto 0)
            );
end left_shifter;

architecture Behavioral of left_shifter is
begin

    B <= (0=>'0', 1=>A(0), 2=>A(1), 3=>A(2));
    
end Behavioral;

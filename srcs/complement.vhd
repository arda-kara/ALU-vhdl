library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity complement is
    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : out STD_LOGIC_VECTOR(3 downto 0));
end complement;

architecture Behavioral of complement is

begin

B <= not A;

end Behavioral;

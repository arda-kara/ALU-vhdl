library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder is
    Port (A    :   in std_logic;
          B    :   in std_logic;
          SUM   :   out std_logic;
          CARRY  :   out std_logic);
end half_adder;

architecture Behavioral of half_adder is

begin
SUM <= A XOR B;
CARRY <= A AND B;

end Behavioral;

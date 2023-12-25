library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port (A    :   in std_logic;
          B    :   in std_logic;
          C   :   in std_logic;
          SUM   :   out std_logic;
          CARRY  :   out std_logic);
end full_adder;

architecture Behavioral of full_adder is

signal sum1, sum2, carry1, carry2 : std_logic;

component half_adder is
Port (    A    :   in std_logic;
          B    :   in std_logic;
          SUM   :   out std_logic;
          CARRY  :   out std_logic);
end component;



begin

    HA1: half_adder
         port map(
                A => A,
                B => B,
                SUM => sum1,
                CARRY => carry1     
                );

    HA2: half_adder
         port map(
                A => C,
                B => sum1,
                SUM => sum2,
                CARRY => carry2     
                );

SUM <= sum2;
CARRY <= carry1 or carry2;

end Behavioral;

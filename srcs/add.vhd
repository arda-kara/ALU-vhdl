library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Four_Bit_Adder is
    Port ( A    : in  STD_LOGIC_VECTOR(3 downto 0);
           B    : in  STD_LOGIC_VECTOR(3 downto 0);
           Cin  : in  STD_LOGIC;
           Sum  : out  STD_LOGIC_VECTOR(3 downto 0);
           Cout : out  STD_LOGIC;
           flag : out STD_LOGIC);
end Four_Bit_Adder;

architecture Behavioral of Four_Bit_Adder is

signal C : STD_LOGIC_VECTOR(3 downto 0) := "0000"; -- internal carry signals initialized to 0
signal cout_internal : std_logic;
component Full_Adder
        Port (A    :   in std_logic;
          B    :   in std_logic;
          C   :   in std_logic;
          SUM   :   out std_logic;
          CARRY  :   out std_logic);
end component;

begin

    -- First full-adder (least significant bit)
    FA0: Full_Adder port map (A=>A(0), B=>B(0), C=>Cin, SUM=>Sum(0), CARRY=>C(1));

    -- Second full-adder
    FA1: Full_Adder port map (A=>A(1), B=>B(1), C=>C(1), SUM=>Sum(1), CARRY=>C(2));

    -- Third full-adder
    FA2: Full_Adder port map (A=>A(2), B=>B(2), C=>C(2), SUM=>Sum(2), CARRY=>C(3));

    -- Fourth full-adder (most significant bit)
    FA3: Full_Adder port map (A=>A(3), B=>B(3), C=>C(3), SUM=>Sum(3), CARRY=>cout_internal);
    
    flag <= '1' when cout_internal /= C(3) else '0';
    

end Behavioral;

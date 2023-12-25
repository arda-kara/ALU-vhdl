library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ALU is
    port(
        A      : in std_logic_vector(3 downto 0);
        B      : in std_logic_vector(3 downto 0);
        opcode : in std_logic_vector(2 downto 0); -- 3-bit opcode
        RES    : out std_logic_vector(3 downto 0);
        flag   : out std_logic
    );
end ALU;

architecture Behavioral of ALU is

    signal complement_out, adder_out, subtractor_out, rotator_right_out, rotator_left_out, shifter_left_out, increment_out, decrement_out: std_logic_vector(3 downto 0);
    signal adder_flag : std_logic;
    signal ZERO: std_logic_vector(3 downto 0) := "0000";

    component Four_Bit_Adder is
        Port ( A    : in  STD_LOGIC_VECTOR(3 downto 0);
               B    : in  STD_LOGIC_VECTOR(3 downto 0);
               Cin  : in  STD_LOGIC;
               Sum  : out  STD_LOGIC_VECTOR(3 downto 0);
               Cout : out  STD_LOGIC;
               flag : out STD_LOGIC);
    end component;

    component Four_Bit_Subtractor is
        Port ( A    : in  STD_LOGIC_VECTOR(3 downto 0);
               B    : in  STD_LOGIC_VECTOR(3 downto 0);
               Cin  : in  STD_LOGIC;
               Sum  : out  STD_LOGIC_VECTOR(3 downto 0);
               Cout : out  STD_LOGIC);
    end component;

    component complement is
        Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
               B : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    component right_rotator is
        port(   A   :   in std_logic_vector(3 downto 0);
                B   :   out std_logic_vector(3 downto 0)
                );
    end component;
    
    component left_rotator is
        port(   A   :   in std_logic_vector(3 downto 0);
                B   :   out std_logic_vector(3 downto 0)
                );
    end component;
    
    component left_shifter is
        port(   A   :   in std_logic_vector(3 downto 0);
                B   :   out std_logic_vector(3 downto 0)
                );
    end component;
    
    component increment is
        port(   A       :   in std_logic_vector(3 downto 0);
                B       :   out std_logic_vector(3 downto 0)
                );
    end component;
    
    component decrement is
        port(   A       :   in std_logic_vector(3 downto 0);
                B       :   out std_logic_vector(3 downto 0)
                );
    end component;
    

begin
    
    ADDER: Four_Bit_Adder port map (A=>A, B=>B, Cin=>'0', Sum=>adder_out, Cout=>OPEN, flag=>adder_flag);

    SUBTRACTOR: Four_Bit_Subtractor port map (A=>A, b=>B, Cin=>'1', Sum=>subtractor_out, Cout=>OPEN);

    ROTATE_RIGHT: right_rotator port map (A=>A, B=>rotator_right_out);

    ROTATE_LEFT: left_rotator port map (A=>A, B=>rotator_left_out);

    SHIFT_LEFT: left_shifter port map (A=>A, B=>shifter_left_out);

    INC: increment port map (A=>A, B=>increment_out);

    DEC: decrement port map (A=>A, B=>decrement_out);
    
    COMP: complement port map (A=>A, B=>complement_out);
    
PROCESS(A, B, opcode)
    BEGIN
        case opcode is
            when "000" =>
                RES <= adder_out;
                flag <= adder_flag;
                
            when "001" =>
                RES <= subtractor_out;
                flag <= '0';

            when "010" =>
                RES <= complement_out;
                flag <= '0';
                
            when "011" =>
                RES <= rotator_right_out;
                flag <= '0';
                
            when "100" =>
                RES <= rotator_left_out;
                flag <= '0';
                
            when "101" =>
                RES <= shifter_left_out;
                flag <= '0';
                
            when "110" =>
                RES <= increment_out;
                flag <= '0';
                
            when "111" =>
                RES <= decrement_out;
                flag <= '0';
                
            when others =>
                RES <= ZERO;
                flag <= '0';
        end case;
    END PROCESS;
end Behavioral;

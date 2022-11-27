
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity segment_driver_tb is
end;

architecture bench of segment_driver_tb is

  component segment_driver
      Port ( i_digits_to_display : in STD_LOGIC_VECTOR (31 downto 0);
             o_segments : out STD_LOGIC_VECTOR (6 downto 0);
             o_anodes : out STD_LOGIC_VECTOR (7 downto 0);
             o_decimal : out STD_LOGIC;
             clk : in STD_LOGIC;
             reset : in STD_LOGIC
            );
  end component;

  signal i_digits_to_display: STD_LOGIC_VECTOR (31 downto 0);
  signal o_segments: STD_LOGIC_VECTOR (6 downto 0);
  signal o_anodes: STD_LOGIC_VECTOR (7 downto 0);
  signal o_decimal: STD_LOGIC;
  signal clk: STD_LOGIC;
  signal reset: STD_LOGIC ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: segment_driver port map ( i_digits_to_display => i_digits_to_display,
                                 o_segments          => o_segments,
                                 o_anodes            => o_anodes,
                                 o_decimal           => o_decimal,
                                 clk                 => clk,
                                 reset               => reset );

  stimulus: process
  begin
  
    -- Put initialisation code here

    reset <= '1';
    wait for 5 ns;
    reset <= '0';
    wait for 5 ns;
    wait until rising_edge(clk);
    i_digits_to_display <= "0001" & "0010" & "0100" & "1000" & "1100" & "1110" & "0001" & "0110";
    -- Put test bench stimulus code here

    
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
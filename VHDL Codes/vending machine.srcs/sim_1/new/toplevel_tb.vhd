
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity top_level_tb is
end;

architecture bench of top_level_tb is

  component top_level
    Port (
          button1 : in STD_LOGIC;
          button2 : in STD_LOGIC;
          button3 : in STD_LOGIC;
          button4 : in STD_LOGIC;
          clk : in STD_LOGIC;
          reset : in STD_LOGIC;
          o_segments : out STD_LOGIC_VECTOR(6 downto 0);
          o_decimal : out STD_LOGIC;
          o_anodes : out STD_LOGIC_VECTOR(7 downto 0);
          o_led1 : out STD_LOGIC;
          o_led2 : out STD_LOGIC
          );
  end component;

  signal button1: STD_LOGIC;
  signal button2: STD_LOGIC;
  signal button3: STD_LOGIC;
  signal button4: STD_LOGIC;
  signal clk: STD_LOGIC;
  signal reset: STD_LOGIC;
  signal o_segments: STD_LOGIC_VECTOR(6 downto 0);
  signal o_decimal: STD_LOGIC;
  signal o_anodes: STD_LOGIC_VECTOR(7 downto 0);
  signal o_led1: STD_LOGIC;
  signal o_led2: STD_LOGIC ;
  
  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;
begin

  uut: top_level port map ( button1    => button1,
                            button2    => button2,
                            button3    => button3,
                            button4    => button4,
                            clk        => clk,
                            reset      => reset,
                            o_segments => o_segments,
                            o_decimal  => o_decimal,
                            o_anodes   => o_anodes,
                            o_led1     => o_led1,
                            o_led2     => o_led2 );

  stimulus: process
  begin
  
    -- Put initialisation code here
    reset <= '0';
    button1 <= '0';
    button2 <= '0';
    button3 <= '0';
    button4 <= '0';
    -- Put test bench stimulus code here
    wait for 5ns;
    wait until rising_edge(clk);
    button1 <= '1';
    wait for 5ns;
    wait until rising_edge(clk);
    button1 <= '0';
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
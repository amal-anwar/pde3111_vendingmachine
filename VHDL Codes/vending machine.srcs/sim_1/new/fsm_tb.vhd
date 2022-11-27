
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity FSM_tb is
end;

architecture bench of FSM_tb is

  component FSM
      Port (
          i_cola : in  STD_LOGIC;
          i_juice  : in  STD_LOGIC;
          i_counter_output : in STD_LOGIC;
          clk : in STD_LOGIC;
          reset : in STD_LOGIC;
          o_enable : out STD_LOGIC;
          o_cola : out STD_LOGIC;
          o_juice : out STD_LOGIC;
          o_done : out STD_LOGIC  
      );
  end component;

  signal i_cola: STD_LOGIC;
  signal i_juice: STD_LOGIC;
  signal i_counter_output: STD_LOGIC;
  signal clk: STD_LOGIC;
  signal reset: STD_LOGIC;
  signal o_enable: STD_LOGIC;
  signal o_cola: STD_LOGIC;
  signal o_juice: STD_LOGIC;
  signal o_done: STD_LOGIC ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: FSM port map ( i_cola           => i_cola,
                      i_juice          => i_juice,
                      i_counter_output => i_counter_output,
                      clk              => clk,
                      reset            => reset,
                      o_enable         => o_enable,
                      o_cola           => o_cola,
                      o_juice          => o_juice,
                      o_done           => o_done );

  stimulus: process
  begin
  
    -- Put initialisation code here
    reset <= '0';
    i_cola <= '0';
    i_juice <= '0';
    i_counter_output <= '0';
    wait for 10ns;
    wait until rising_edge(clk);
    --i_cola <= '1';
    i_juice <= '1';
    wait for 20ns;
    wait until rising_edge(clk);
    --i_cola <= '0';
    i_juice <= '0';
    -- Put test bench stimulus code here
    wait for 100ns;
    wait until rising_edge(clk);
    i_counter_output <= '1';

    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      Clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
  
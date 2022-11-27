
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity counter_tb is
end;

architecture bench of counter_tb is

  component counter
      Port( 
          i_five_button : in STD_LOGIC;
          i_ten_button : in STD_LOGIC;
          i_twenty_button : in STD_LOGIC;
          i_fifty_button : in STD_LOGIC;
          i_enable : in STD_LOGIC;
          i_cola : in STD_LOGIC;
          i_juice : in STD_LOGIC;
          clk : in STD_LOGIC;
          reset : in STD_LOGIC;
          o_goal_reached : out STD_LOGIC;
          o_output_to_segments : out STD_LOGIC_VECTOR(31 downto 0) ;
          o_give_cola : out STD_LOGIC;
          o_give_juice : out STD_LOGIC     
          );
  end component;

  signal i_five_button: STD_LOGIC;
  signal i_ten_button: STD_LOGIC;
  signal i_twenty_button: STD_LOGIC;
  signal i_fifty_button: STD_LOGIC;
  signal i_enable: STD_LOGIC;
  signal i_cola: STD_LOGIC;
  signal i_juice: STD_LOGIC;
  signal clk: STD_LOGIC;
  signal reset: STD_LOGIC;
  signal o_goal_reached: STD_LOGIC;
  signal o_output_to_segments: STD_LOGIC_VECTOR(31 downto 0);
  signal o_give_cola: STD_LOGIC;
  signal o_give_juice: STD_LOGIC ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: counter port map ( i_five_button        => i_five_button,
                          i_ten_button         => i_ten_button,
                          i_twenty_button      => i_twenty_button,
                          i_fifty_button       => i_fifty_button,
                          i_enable             => i_enable,
                          i_cola               => i_cola,
                          i_juice              => i_juice,
                          clk                  => clk,
                          reset                => reset,
                          o_goal_reached       => o_goal_reached,
                          o_output_to_segments => o_output_to_segments,
                          o_give_cola          => o_give_cola,
                          o_give_juice         => o_give_juice );

  stimulus: process
  begin
  
    -- Put initialisation code here
    i_five_button <= '0';
    i_ten_button <= '0';
    i_twenty_button <= '0';
    i_fifty_button <= '0';
    i_enable <= '1';
    reset <= '0';
    i_juice <= '1';
    i_cola <= '0';
    -- Put test bench stimulus code here
    -- Put initialisation code here
    
    wait for 10ns;
    wait until rising_edge(clk);
    i_five_button <= '1';
    wait for 5ns;

    i_five_button <= '0';
    
    wait for 10ns;
    wait until rising_edge(clk);
    i_fifty_button <= '1';
    wait for 3ns;

    i_fifty_button <= '0';
    
    
    wait for 10ns;
    wait until rising_edge(clk);
    i_fifty_button <= '1';
    wait for 3ns;

    i_fifty_button <= '0';
    
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
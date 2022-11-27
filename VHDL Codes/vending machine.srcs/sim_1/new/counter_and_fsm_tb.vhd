library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity counter_and_fsm_tb is
--  Port ( );
end counter_and_fsm_tb;

architecture Behavioral of counter_and_fsm_tb is
component FSM is
    Port(
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
    
    component counter is
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
        o_output_to_segments : out STD_LOGIC_VECTOR(31 downto 0);
        o_give_cola : out STD_LOGIC;
        o_give_juice : out STD_LOGIC;
        o_initial_state : out STD_LOGIC
        );
    end component;
    
    signal enable, cola, juice,done, counter_output : STD_LOGIC;
    signal output_to_segments : STD_LOGIC_VECTOR(31 downto 0);
    signal clk : STD_LOGIC;
    signal reset ,o_led1, o_led2: STD_LOGIC;
    constant clock_period: time := 10 ns;
    signal stop_the_clock: boolean;
      signal i_five_button: STD_LOGIC;
      
  signal i_ten_button: STD_LOGIC;
  signal i_twenty_button: STD_LOGIC;
  signal i_fifty_button: STD_LOGIC;
  signal i_enable: STD_LOGIC;
  signal i_cola: STD_LOGIC;
  signal i_juice: STD_LOGIC;
  signal i_counter_output: STD_LOGIC;
    signal o_initial_state : STD_LOGIC;
begin


  stimulus: process
  begin
  
    -- Put initialisation code here
    reset <= '0';
    i_cola <= '0';
    i_juice <= '0';
    i_counter_output <= '0';
    i_five_button <= '0';
    i_ten_button <= '0';
    i_twenty_button <= '0';
    i_fifty_button <= '0';
    i_enable <= '1';    
    -- Put test bench stimulus code here
    wait for 50ns;
    i_juice <= '1';
    i_cola <= '0';
    wait for 10ns;

    i_juice <= '0';
    
    wait for 5ns;
    wait until rising_edge(clk);
    i_five_button <= '1';
    wait for 5ns;
    wait until rising_edge(clk);
    i_five_button <= '0';
    
    wait for 5ns;
    wait until rising_edge(clk);
    i_fifty_button <= '1';
    wait for 5ns;
    wait until rising_edge(clk);
    i_fifty_button <= '0';
 
    wait for 5ns;
    wait until rising_edge(clk);
    i_five_button <= '1';
    wait for 5ns;
    wait until rising_edge(clk);
    i_five_button <= '0';
    
    wait for 5ns;
    wait until rising_edge(clk);
    i_fifty_button <= '1';
    wait for 5ns;
    wait until rising_edge(clk);
    i_fifty_button <= '0';
    
    wait for 100ns;
    wait until rising_edge(clk);
    
    i_juice <= '1';
    wait for 10ns;
    i_juice <= '0';
    
    wait for 100ns;
    i_juice <= '1';
    wait for 10ns;
    i_juice <= '0';
    
    wait;
  end process;
    FSM_inst : FSM PORT MAP(
        i_cola => i_cola,
        i_juice => i_juice,
        i_counter_output => counter_output ,
        clk => clk,
        reset => reset,
        o_enable => enable,
        o_cola => cola,
        o_juice => juice,
        o_done => done
    );

    counter_inst : counter PORT MAP(
        i_five_button => i_five_button,
        i_ten_button => i_ten_button,
        i_twenty_button => i_twenty_button,
        i_fifty_button => i_fifty_button,
        i_enable => enable,
        i_cola => cola,
        i_juice => juice,
        clk => clk,
        reset => done,
        o_goal_reached => counter_output,
        o_output_to_segments => output_to_segments,
        o_give_cola => o_led1,
        o_give_juice => o_led2,
        o_initial_state => o_initial_state
    );  
  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;
end Behavioral;

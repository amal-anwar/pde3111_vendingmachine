library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top_level_tb_indepth is
--  Port ( );
end top_level_tb_indepth;

architecture Behavioral of top_level_tb_indepth is

    
    component edge_detector is
        port (clk : in STD_LOGIC;
              i_edge_to_detect : in STD_LOGIC;
              o_pulse: out STD_LOGIC
        );
    end component;

    component debouncer is
        port (
            clk : in  STD_LOGIC;
            i_button : in  STD_LOGIC;
            o_debounce : out STD_LOGIC
        );
    end component;
    
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
        o_give_juice : out STD_LOGIC    
        );
    end component;
    
    component segment_driver is
    Port ( i_digits_to_display : in STD_LOGIC_VECTOR (31 downto 0);
           o_segments : out STD_LOGIC_VECTOR (6 downto 0);
           o_anodes : out STD_LOGIC_VECTOR (7 downto 0);
           o_decimal : out STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC
          );
    end component;
    
component clock_divider is generic (divider: integer);
   Port( 
        clk: in std_logic;
        o_clk: out std_logic
    );
end component;
  
    
    signal button1_debounce,button2_debounce,button3_debounce,button4_debounce,enable, cola, juice,done, counter_output, decimal, segment_clk : STD_LOGIC;
    signal output_to_segments : STD_LOGIC_VECTOR(31 downto 0);
    signal anodes : STD_LOGIC_VECTOR(7 downto 0);
    signal segments : STD_LOGIC_VECTOR(6 downto 0);

    constant clock_period: time := 10 ns;
    signal stop_the_clock: boolean;
    signal button1 :  STD_LOGIC;
    signal button2 :  STD_LOGIC;
    signal button3 :  STD_LOGIC;
    signal button4 :  STD_LOGIC;
    signal clk : STD_LOGIC;
    signal reset :  STD_LOGIC;
    signal o_segments :  STD_LOGIC_VECTOR(6 downto 0);
    signal o_decimal :  STD_LOGIC;
    signal o_anodes :  STD_LOGIC_VECTOR(7 downto 0);
    signal o_led1 :  STD_LOGIC;
    signal o_led2 :  STD_LOGIC;
begin


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
    button1 <= '1';
    wait;
  end process;
    
    button1_edge_detect : edge_detector PORT MAP(
        clk => clk,
        i_edge_to_detect => button1,
        o_pulse => button1_debounce
    );
        
    button2_edge_detect : edge_detector PORT MAP(
        clk => clk,
        i_edge_to_detect => button2,
        o_pulse => button2_debounce
    );
    
    button3_edge_detect : edge_detector PORT MAP(
        clk => clk,
        i_edge_to_detect => button3,
        o_pulse => button3_debounce
    );
    
    button4_edge_detect : edge_detector PORT MAP(
        clk => clk,
        i_edge_to_detect => button4,
        o_pulse => button4_debounce
    );

    FSM_inst : FSM PORT MAP(
        i_cola => button1_debounce,
        i_juice => button2_debounce,
        i_counter_output => counter_output ,
        clk => clk,
        reset => reset,
        o_enable => enable,
        o_cola => cola,
        o_juice => juice,
        o_done => done
    );

    counter_inst : counter PORT MAP(
        i_five_button => button1_debounce,
        i_ten_button => button2_debounce,
        i_twenty_button => button3_debounce,
        i_fifty_button => button4_debounce,
        i_enable => enable,
        i_cola => cola,
        i_juice => juice,
        clk => clk,
        reset => reset,
        o_goal_reached => counter_output,
        o_output_to_segments => output_to_segments,
        o_give_cola => o_led1,
        o_give_juice => o_led2
    );   

    segment_driver_inst : segment_driver PORT MAP(
        i_digits_to_display => output_to_segments,
        o_segments => segments,
        o_anodes => anodes,
        o_decimal => decimal,
        clk => segment_clk,
        reset => reset
    );
    
    segment_clk_divider : clock_divider generic map (divider=>30000) PORT MAP(
        clk => clk,
        o_clk => segment_clk
    );    
    
    o_segments <= segments;
    o_anodes <= anodes;
    o_decimal <= decimal;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
end process;
end Behavioral;

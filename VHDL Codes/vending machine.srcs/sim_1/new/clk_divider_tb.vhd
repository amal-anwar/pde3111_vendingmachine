library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_divider_tb is
--  Port ( );
end clk_divider_tb;

architecture Behavioral of clk_divider_tb is
component clock_divider is generic (divider: integer);
    port ( clk: in std_logic;
    o_clk: out std_logic
    );
end component;
    signal clk : STD_LOGIC;
    signal o_clk, segment_clk : STD_LOGIC;
    constant clock_period: time := 10 ns;
    signal stop_the_clock: boolean;
    signal temporal : STD_LOGIC := '0';
    signal counter : integer range 0 to 30000 := 0; 
begin

    
    segment_clk_divider : clock_divider generic map (divider=>30000) PORT MAP(
        clk => clk,
        o_clk => segment_clk
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

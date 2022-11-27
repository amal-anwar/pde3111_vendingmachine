-------------------------------------------------------------------------------------------------------------------------------------------------------
-- Author: Abubakar Munye
-------------------------------------------------------------------------------------------------------------------------------------------------------
-- Purpose: this debounces a button and toggles the output every time a debounce is detected
-------------------------------------------------------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
 
entity debouncer is
  port (clk : in  STD_LOGIC;
        i_button : in  STD_LOGIC;
        o_debounce : out STD_LOGIC
    );
end entity debouncer;
 
architecture RTL of debouncer is
 
signal ss1,ss2,pulse,o_pulse,clk_debounce: STD_LOGIC := '0';
    component edge_detector is
        port (clk : in STD_LOGIC;
              i_edge_to_detect : in STD_LOGIC;
              o_pulse: out STD_LOGIC
        );
    end component;
    component clock_divider is generic (divider: integer);
       Port( 
            clk: in std_logic;
            o_clk: out std_logic
        );
    end component;
begin
        
    button_clk_inst : clock_divider generic map (divider=>499999) PORT MAP(
        clk => clk,
        o_clk => clk_debounce
    );    
    edge_detect : edge_detector PORT MAP(
        clk => clk,
        i_edge_to_detect => pulse, 
        o_pulse => o_pulse 
    );
    
------------------------------------------------------------------------------------------------
-- debouncer: when debounce detected pulse is toggled                                    
------------------------------------------------------------------------------------------------    
 
    debounce : process(clk_debounce) begin
        if (rising_edge(clk_debounce)) then
            if i_button = '1' then --to detect "risingedge" for the button
                ss1 <= '1'; -- saves the previous state of the button
                elsif i_button = '0' then
                    ss1 <= '0'; -- saves the previous state of the button
            end if;
            ss2 <= ss1; -- current state of button 
            if ss2 = '0' and ss1 = '1' then -- if current state is 0 and previous state is 1 then the button was pressed 
                pulse <= not pulse; -- toggle the output... if its high make it low and if its low make it high
            end if;
        end if;
    end process;
    
    o_debounce <= o_pulse;
    
end architecture RTL;
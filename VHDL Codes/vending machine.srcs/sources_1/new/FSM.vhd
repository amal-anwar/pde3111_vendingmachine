-------------------------------------------------------------------------------------------------------------------------------------------------------
-- Author: Abubakar Munye
-------------------------------------------------------------------------------------------------------------------------------------------------------
-- Purpose: this functional state machine will have 3 states: initial state where the state machine waits for an input
--          before setting the enable high and juice or cola high then goes to counting state. which couunts up
--          when counter has recieved enough money it goes into done state where it waits for button 1 or button 2
--          when button one or 2 clicked goes back to initial state
-------------------------------------------------------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM is
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
end FSM;

architecture Behavioral of FSM is   
    type states IS (initial_state,counting_state,done_state);
    signal current_state : states;
begin

    fsm : process (clk, i_cola, i_juice, reset) begin
        if reset = '1' then
            -- reset 
            current_state <= initial_state; -- go back to initial state 
            
            else if rising_edge(Clk) then
                case current_state is
                    when initial_state =>
                        -- resets everything here 
                        o_enable <= '0'; 
                        o_cola <= '0';
                        o_juice <= '0';
                        o_done <= '0';
                        if i_cola = '1' then -- if cola button pressed go to counting state 
                            current_state <= counting_state;
                            o_cola <= '1'; -- cola picked
                        end if;
                        if i_juice = '1' then -- if juice picked go to counting state
                            current_state <= counting_state;
                            o_juice <= '1';
                        end if;
                    when counting_state =>
                        o_enable <= '1'; -- when in counting state set enable high 
                        if i_counter_output = '1' then  -- if done counting then go to done state 
                            current_state <= done_state;
                        end if;
                    when done_state => -- when in done state wait for button 1 or 2 to be pressed
                         if i_cola = '1' or i_juice = '1' then -- when these buttons are pressed then reset and go back to initial counter
                            current_state <= initial_state;
                            o_done <= '1'; -- reset for the counter 
                            o_juice <= '0';
                            o_cola <= '0';
                        end if;
                end case;
            end if;
        end if;
    end process;    
    
end Behavioral;

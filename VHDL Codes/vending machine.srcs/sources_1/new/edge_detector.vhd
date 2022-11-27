-------------------------------------------------------------------------------------------------------------------------------------------------------
-- Author: Abubakar Munye
-------------------------------------------------------------------------------------------------------------------------------------------------------
-- Purpose: due to the nature of the debounce ( it toggles rather than sends out one pulse)
--          an edge detector is needed to check if the debounce changed from high to low or low to high
--          if an edge is detected a pulse is sent out
-------------------------------------------------------------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity edge_detector is
    port (clk : in STD_LOGIC;
          i_edge_to_detect : in STD_LOGIC;
          o_pulse: out STD_LOGIC
    );
end edge_detector;

architecture bhv of edge_detector is

signal edge_delayed :STD_LOGIC;

begin
------------------------------------------------------------------------------------------------
-- edge_detector:  this process detects an edge every time the input is turned from low to high
--                 or high to low and outputs a pulse                                      
------------------------------------------------------------------------------------------------    
  
    edge_detector : process(clk)
    begin
        if rising_edge(clk) then
                edge_delayed <= i_edge_to_detect;
            end if;
    end process;
    
    o_pulse <= (edge_delayed xor i_edge_to_detect); --rising or falling edge (0 -> 1 xor 1 -> 0)
end bhv;
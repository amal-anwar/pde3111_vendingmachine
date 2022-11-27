-------------------------------------------------------------------------------------------------------------------------------------------------------
-- Author: Abubakar Munye
-------------------------------------------------------------------------------------------------------------------------------------------------------
-- Purpose:
-- This entity/architecture drives the 8 digit 7 segment display the output of each digit 
-- depends on the input of the corresponding digit. e.g. the i_first_digit drives the first digit etc..
-- the decimal will show high when multiplexing the second digit
-------------------------------------------------------------------------------------------------------------------------------------------------------
library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;
    use IEEE.NUMERIC_STD.ALL;
    use IEEE.STD_LOGIC_ARITH.ALL;
    use IEEE.std_logic_unsigned.all;

entity segment_driver is
    Port ( i_digits_to_display : in STD_LOGIC_VECTOR (39 downto 0);
           o_segments : out STD_LOGIC_VECTOR (6 downto 0);
           o_anodes : out STD_LOGIC_VECTOR (7 downto 0);
           o_decimal : out STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC
          );
end segment_driver;

architecture Behavioral of segment_driver is    
    component seven_segment_decoder is
        Port ( i_to_decode : in STD_LOGIC_VECTOR (4 downto 0); 
               o_decoded_output : out STD_LOGIC_VECTOR (6 downto 0) 
              );
    end component;
    
    signal what_to_decode : STD_LOGIC_VECTOR(4 downto 0);
    type anode_states IS (anode0,anode1,anode2,anode3,anode4,anode5,anode6,anode7);
    signal current_anode_multiplexed : anode_states;
begin
 
    segment_decoder : seven_segment_decoder PORT MAP(
        i_to_decode => what_to_decode, -- 4 digit input to decode 
        o_decoded_output => o_segments -- decoded outputs to the segments
    );
    
    multiplex_7_segment: process(clk,reset)
    begin
        if reset = '1' then
--         reset 
            current_anode_multiplexed <= anode0;
        elsif rising_edge(clk) then 
            CASE current_anode_multiplexed is 
                When anode0 => 
                    what_to_decode <= i_digits_to_display(4 downto 0); 
                    o_anodes <= "11111110";
                    o_decimal <= '1';
                    current_anode_multiplexed <= anode1; 
                When anode1 =>
                    what_to_decode <= i_digits_to_display(9 downto 5);
                    o_anodes <= "11111101";
                    o_decimal <= '1'; 
                    current_anode_multiplexed <= anode2; 
                When anode2 => 
                    what_to_decode <= i_digits_to_display(14 downto 10);
                    o_anodes <= "11111011";
                    o_decimal <= '1'; 
                    current_anode_multiplexed <= anode3; 
                When anode3 => 
                    what_to_decode <= i_digits_to_display(19 downto 15);  
                    o_anodes <= "11110111";
                    o_decimal <= '1';
                    current_anode_multiplexed <= anode4;
                When anode4 => 
                    what_to_decode <= i_digits_to_display(24 downto 20);  
                    o_anodes <= "11101111"; 
                    o_decimal <= '1';
                    current_anode_multiplexed <= anode5;
                When anode5 => 
                    what_to_decode <= i_digits_to_display(29 downto 25);  
                    o_anodes <= "11011111"; 
                    o_decimal <= '1';
                    current_anode_multiplexed <= anode6; 
                When anode6 => 
                    what_to_decode <=i_digits_to_display(34 downto 30);  
                    o_anodes <= "10111111"; 
                    o_decimal <= '1';
                    current_anode_multiplexed <= anode7; 
                When anode7 => 
                    what_to_decode <= i_digits_to_display(39 downto 35);  
                    o_anodes <= "01111111"; 
                    o_decimal <= '1';
                    current_anode_multiplexed <= anode0; 
             end case;
        end if;
    end process;
end Behavioral;

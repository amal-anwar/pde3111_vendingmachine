-------------------------------------------------------------------------------------------------------------------------------------------------------
-- Author: Abubakar Munye
-------------------------------------------------------------------------------------------------------------------------------------------------------
-- Purpose:
-- This entity/architecture decodes a 4 bit binary input into an output for a 7 segment display 
-------------------------------------------------------------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seven_segment_decoder is
    Port ( i_to_decode : in STD_LOGIC_VECTOR (4 downto 0); -- what we are going to decode
           o_decoded_output : out STD_LOGIC_VECTOR (6 downto 0) -- decoded output
          );
end seven_segment_decoder;

architecture Behavioral of seven_segment_decoder is
begin
------------------------------------------------------------------------------------------------
-- demux_proc: this process demultiplexes a 4 bit binary number into a seven segment output
------------------------------------------------------------------------------------------------
    demux_process : process (i_to_decode)
        begin
        case i_to_decode is
            when "00000" => 
                o_decoded_output <= "0000001"; -- 0 
            when "00001" => 
                o_decoded_output <= "1001111"; -- 1
            when "00010" => 
                o_decoded_output <= "0010010"; -- 2
            when "00011" => 
                o_decoded_output <= "0000110"; -- 3
            when "00100" => 
                o_decoded_output <= "1001100"; -- 4
            when "00101" => 
                o_decoded_output <= "0100100"; -- 5
            when "00110" => 
                o_decoded_output <= "0100000"; -- 6
            when "00111" => 
                o_decoded_output <= "0001111"; -- 7
            when "01000" => 
                o_decoded_output <= "0000000"; -- 8
            when "01001" => 
                o_decoded_output <= "0000100"; -- 9
            when "01010" => 
                o_decoded_output <= "0001000"; -- A
            when "01011" => 
                o_decoded_output <= "1100000"; -- B
            when "01100" => 
                o_decoded_output <= "0110001"; -- C
            when "01101" => 

                o_decoded_output <= "0001001"; -- N 
            when "01110" => 
                o_decoded_output <= "0110000"; -- E
            when "01111" => 
                o_decoded_output <= "1001000"; -- H 
            when "10000" =>
                o_decoded_output <= "1000111"; -- J
            when "10001" =>       
                o_decoded_output <= "1000001"; -- U
            when "10010" =>
                o_decoded_output <= "1110001"; -- L
            when others => 
                o_decoded_output <= "1001000"; -- X
        end case;
    end Process ;
end Behavioral;

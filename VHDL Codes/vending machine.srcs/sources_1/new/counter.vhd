library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use ieee.std_logic_unsigned.all;

entity counter is
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
        o_output_to_segments : out STD_LOGIC_VECTOR(39 downto 0) ;
        o_give_cola : out STD_LOGIC;
        o_give_juice : out STD_LOGIC   
        );
end counter;

architecture Behavioral of counter is
signal sum_of_coins_inserted : STD_LOGIC_VECTOR(7 downto 0);
signal reached_goal : boolean;
signal price_of_drink : integer range 0 to 200;
signal sum_of_coins_inserted_bcd : STD_LOGIC_VECTOR(11 downto 0);
signal change : STD_LOGIC_VECTOR(7 downto 0);
signal change_bcd : STD_LOGIC_VECTOR(11 downto 0);

-- DOUBLE DABBLE ALGORITHM --- 
--  CONVERTS 8-bit binary signal into a 12 bit BCD 
-- E.G bin = "01100011"   ,     output = "0000 1001 1001"  (99).
--     bin = "11111110"   ,     output = "0010 0101 0100"  (254).
--     bin = "10111011"   ,     output = "0001 1000 0111"  (187).
function to_bcd ( bin : std_logic_vector(7 downto 0) ) return std_logic_vector is
    variable i : integer:=0;
    variable bcd : std_logic_vector(11 downto 0) := (others => '0');
    variable bint : std_logic_vector(7 downto 0) := bin;
    
    begin
    for i in 0 to 7 loop  -- repeating 8 times.
        bcd(11 downto 1) := bcd(10 downto 0);  --shifting the bits.
        bcd(0) := bint(7);
        bint(7 downto 1) := bint(6 downto 0);
        bint(0) :='0';
        
        
        if(i < 7 and bcd(3 downto 0) > "0100") then --add 3 if BCD digit is greater than 4.
            bcd(3 downto 0) := bcd(3 downto 0) + "0011";
        end if;
        
        if(i < 7 and bcd(7 downto 4) > "0100") then --add 3 if BCD digit is greater than 4.
            bcd(7 downto 4) := bcd(7 downto 4) + "0011";
        end if;
        
        if(i < 7 and bcd(11 downto 8) > "0100") then  --add 3 if BCD digit is greater than 4.
            bcd(11 downto 8) := bcd(11 downto 8) + "0011";
        end if; 
    
    end loop;
    return bcd;
end to_bcd;
begin
------------------------------------------------------------------------------------------------
-- drink price: sets the price of the drink                                 
------------------------------------------------------------------------------------------------    
    price_of_drink_process : process(clk)
    begin
        if reset = '1' then
            price_of_drink <= 0; -- reset drink price
        elsif rising_edge(clk) then
            if i_cola = '1' then -- if cola is high then price is 60
                price_of_drink <= 60;
            end if;
            if i_juice = '1' then -- if juice is high then price is 80
                price_of_drink <= 80;
            end if;
        end if;
    end process;
------------------------------------------------------------------------------------------------
-- coins inserted: sums up the amount of coins inserted                                 
------------------------------------------------------------------------------------------------  
    coins_inserted: process(clk,reset,i_five_button,i_ten_button,i_twenty_button,i_fifty_button)
    begin
        if reset = '1' then
        -- reset
            sum_of_coins_inserted <= (others => '0');
        elsif falling_edge(clk) then
            if reached_goal = false then
                if i_enable = '1' then
                    if i_five_button = '1' then
                        sum_of_coins_inserted <= std_logic_vector(to_unsigned(to_integer(unsigned( sum_of_coins_inserted )) + 5, 8)); -- convert the vector to an integer and add 5 and then back to a vector
                    end if;
                    if i_ten_button = '1' then
                        sum_of_coins_inserted <= std_logic_vector(to_unsigned(to_integer(unsigned( sum_of_coins_inserted )) + 10, 8));
                    end if;
                    if i_twenty_button = '1' then
                        sum_of_coins_inserted <= std_logic_vector(to_unsigned(to_integer(unsigned( sum_of_coins_inserted )) + 20, 8));
                    end if;
                    if i_fifty_button = '1' then
                        sum_of_coins_inserted <= std_logic_vector(to_unsigned(to_integer(unsigned( sum_of_coins_inserted )) + 50, 8));
                    end if;
                end if;
            end if; 
        end if;

    end process;
------------------------------------------------------------------------------------------------
-- goal reached: checks if the sum of the money inserted is = or greater to price of drink                               
------------------------------------------------------------------------------------------------  
    check_if_reached_goal: process(clk)
    begin
        if reset = '1' then
        -- reset
            reached_goal <= false;
            o_goal_reached <= '0';
            --change <= "00000000";
        elsif rising_edge(clk) then
            if to_integer(unsigned(sum_of_coins_inserted)) >= price_of_drink and price_of_drink > 0 then -- convert std_logic_vector to integer then check if it's > price of drink 
                reached_goal <= true;
                o_goal_reached <= '1';
                
               -- change <= sum_of_coins_inserted - price_of_drink;
            else 
                --change <= 0;
                reached_goal <= false;
                o_goal_reached <= '0';
            end if;
        end if;

    end process;
------------------------------------------------------------------------------------------------
-- process for segemnts output: converts the necessary binaries and vectors to bcd for the seven segment display     
------------------------------------------------------------------------------------------------  
    segment_output: process(clk)
    begin
        if reset = '1' then
            o_output_to_segments <= "01100" & "00000" & "10010" & "01010" & "10000" & "10001" & "00001" & "01100"; -- sets the initial screen to say cola juic 
            o_give_cola <= '0';
            o_give_juice <= '0';
            change_bcd <= (others => '0'); -- change bcd = 0
        elsif rising_edge(clk) then
            if reached_goal = false then
                o_give_cola <= '0';
                o_give_juice <= '0';
                sum_of_coins_inserted_bcd <= to_bcd(sum_of_coins_inserted); -- converts sum_of_coins_inserted from binary to bcd 
                if i_juice = '1' then
                    -- o_output to segemnts will say 0080 on the left segemnts and on the right segments the current sum of money placed will display
                    o_output_to_segments <= "00000" & "00000" & "01000" & "00000" & "00000" & "0" & sum_of_coins_inserted_bcd(11 downto 8) & "0" & sum_of_coins_inserted_bcd(7 downto 4) & "0" & sum_of_coins_inserted_bcd(3 downto 0);
                end if;
                if i_cola = '1' then
                    -- o_output to segemnts will say 0060 on the left segemnts and on the right segments the current sum of money placed will display
                    o_output_to_segments <= "00000" & "00000" & "00110" & "00000" & "00000" & "0" & sum_of_coins_inserted_bcd(11 downto 8) & "0" & sum_of_coins_inserted_bcd(7 downto 4) & "0" & sum_of_coins_inserted_bcd(3 downto 0);
                end if;
                
            else -- if reached goal = true
                if i_juice = '1' then
                    change <= std_logic_vector(to_unsigned(to_integer(unsigned( sum_of_coins_inserted )) - 80, 8)); -- converts sum of coins inserted from std_vector to integer then - 80 then converts it back to vector
                    change_bcd <= to_bcd(change); -- converts change from binary to bcd 
                    o_give_juice <= '1'; -- output a juice 
                end if;
                if i_cola = '1' then
                    change <= std_logic_vector(to_unsigned(to_integer(unsigned( sum_of_coins_inserted )) - 60, 8)); -- converts sum of coins inserted from std_vector to integer then - 60 then converts it back to vector
                    change_bcd <= to_bcd(change); -- converts change from binary to bcd
                    o_give_cola <= '1'; -- output cola 
                end if;
                o_output_to_segments <= "01100" & "01111" & "01010" & "01101" & "01001" & "01110" & "0" & change_bcd(7 downto 4) & "0" & change_bcd(3 downto 0); 
                -- on the first 6 segments it displays "CHANGE" on the last 2 digits it displays the change you recieve
            end if;
        end if;

    end process;
    
end Behavioral;

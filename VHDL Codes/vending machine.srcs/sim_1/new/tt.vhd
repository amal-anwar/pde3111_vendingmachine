library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use ieee.std_logic_unsigned.all;


entity counter_tb_in_detail is
--  Port ( );
end counter_tb_in_detail;

--entity counter is
-- Port ( i_five_button : in STD_LOGIC;
--        i_ten_button : in STD_LOGIC;
  --      i_twenty_button : in STD_LOGIC;
    --    i_fifty_button : in STD_LOGIC;
      --  i_enable : in STD_LOGIC;
--        i_cola : in STD_LOGIC;
  --    -  i_juice : in STD_LOGIC;
   --     clk : in STD_LOGIC;
     --   reset : in STD_LOGIC;
  --      o_goal_reached : out STD_LOGIC;
    --    o_output_to_segments : out STD_LOGIC_VECTOR(31 downto 0)      
      --   );
--end counter;


architecture Behavioral of counter_tb_in_detail is
   
    signal i_five_button : STD_LOGIC;
    signal i_ten_button :  STD_LOGIC;
    signal i_twenty_button :  STD_LOGIC;
    signal i_fifty_button :  STD_LOGIC;
    signal clk : STD_LOGIC;
    signal i_enable : STD_LOGIC;
    signal i_cola : STD_LOGIC;
    signal i_juice : STD_LOGIC;
    signal reset : STD_LOGIC;
    constant clock_period: time := 10 ns;
    signal stop_the_clock: boolean;
    signal sum_of_coins_inserted : STD_LOGIC_VECTOR(7 downto 0);
    signal reached_goal : boolean;
    signal price_of_drink : integer range 0 to 200;
    signal o_goal_reached : STD_LOGIC;

    signal o_give_cola : STD_LOGIC;
    signal o_give_juice : STD_LOGIC;

    signal sum_of_coins_inserted_bcd : STD_LOGIC_VECTOR(11 downto 0);
    signal change : STD_LOGIC_VECTOR(7 downto 0);
    signal change_bcd : STD_LOGIC_VECTOR(11 downto 0);
    signal o_output_to_segments : STD_LOGIC_VECTOR(31 downto 0);
    
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
  stimulus: process
  begin
  
 -- Put initialisation code here
    i_five_button <= '0';
    i_ten_button <= '0';
    i_twenty_button <= '0';
    i_fifty_button <= '0';
    i_enable <= '1';
    reset <= '0';
    i_juice <= '0';
    i_cola <= '1';
    -- Put test bench stimulus code here
    -- Put initialisation code here
    
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
    i_twenty_button <= '1';
    wait for 5ns;
    wait until rising_edge(clk);
    i_twenty_button <= '1';
    wait for 50ns;
    reset <= '1';
    wait for 50ns; 
    reset <= '0';
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

    price_of_drink_process : process(clk)
    begin
    if reset = '1' then
        price_of_drink <= 0;
        else if rising_edge(clk) then
            if i_cola = '1' then
                price_of_drink <= 60;
            end if;
            if i_juice = '1' then
                price_of_drink <= 80;
            end if;
        end if;
    end if;
    end process;

    coins_inserted: process(clk,reset,i_five_button,i_ten_button,i_twenty_button,i_fifty_button)
    begin
        if reset = '1' then
        -- reset
            sum_of_coins_inserted <= "00000000";
        else if falling_edge(clk) then
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
        end if;
    end process;
    
    check_if_reached_goal: process(clk)
    begin
        if reset = '1' then
        -- reset
            reached_goal <= false;
            o_goal_reached <= '0';
            --change <= "00000000";
           else if rising_edge(clk) then
                if to_integer(unsigned(sum_of_coins_inserted)) > price_of_drink and price_of_drink > 0 then -- convert std_logic_vector to integer then check if it's > price of drink 
                    reached_goal <= true;
                    o_goal_reached <= '1';
                    
                   -- change <= sum_of_coins_inserted - price_of_drink;
                else 
                    --change <= 0;
                    reached_goal <= false;
                    o_goal_reached <= '0';
                end if;
            end if;
        end if;
    end process;
       
    segment_output: process(clk)
    begin
        if reset = '1' then
        --reset
        o_output_to_segments <= "00000000000000000000000000000000";
        o_give_cola <= '0';
        o_give_juice <= '0';
        change_bcd <= "000000000000";
         else if rising_edge(clk) then
                if reached_goal = false then
                    o_give_cola <= '0';
                    o_give_juice <= '0';
                    sum_of_coins_inserted_bcd <= to_bcd(sum_of_coins_inserted);
                    if i_juice = '1' then
                        o_output_to_segments <= "0000" & "0000" & "1000" & "0000" & "0000" & sum_of_coins_inserted_bcd;
                    end if;
                    if i_cola = '1' then
                        o_output_to_segments <= "0000" & "0000" & "0110" & "0000" & "0000" & sum_of_coins_inserted_bcd;
                    end if;
                else -- if reached goal = true
                    if i_juice = '1' then
                        change <= std_logic_vector(to_unsigned(to_integer(unsigned( sum_of_coins_inserted )) - 80, 8));
                        change_bcd <= to_bcd(change);
                        o_give_juice <= '1';
                    end if;
                    if i_cola = '1' then
                        change <= std_logic_vector(to_unsigned(to_integer(unsigned( sum_of_coins_inserted )) - 60, 8));
                        change_bcd <= to_bcd(change);
                        o_give_cola <= '1';
                    end if;
                    o_output_to_segments <= "1100" & "1111" & "1010" & "1101" & "1001" & "1110" & change_bcd(7 downto 0);
                end if;
            end if;
        end if;
    end process;
    
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.10.2019 15:45:20
-- Design Name: 
-- Module Name: testbecsgdfgdgdfgdfgdd - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testbecsgdfgdgdfgdfgdd is
--  Port ( );
end testbecsgdfgdgdfgdfgdd;

architecture Behavioral of testbecsgdfgdgdfgdfgdd is
    signal teset : STD_LOGIC_VECTOR(100 downto 0);
begin
    test : process 
    begin
    
    teset <= (others => '0');
    wait for 20ns;
    
    teset <= (3 downto 0 => '1' ,others => '0');
    wait;
    end process;

end Behavioral;

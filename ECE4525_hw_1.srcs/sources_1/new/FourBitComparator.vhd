----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/15/2022 10:46:12 PM
-- Design Name: 
-- Module Name: FourBitComparator - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FourBitComparator is
  Port (A, B: in std_logic_vector(0 to 3);
        cAgtB, cAltB, cAeqB: in std_logic ;
        AgtB, AltB, AeqB: out std_logic );
end FourBitComparator;

architecture Behavioral of FourBitComparator is
begin
process(A, B, cAeqB, cAgtB, cAltB)
    --variable Count : std_logic_vector (2 downto 0);
    
begin
    --Count := "000";
    For_Loop:
    for i in A'range loop
        if((A(i) > B(i)) or (cAgtB = '1' and cAltB = '0' and cAeqB = '0')) then
            AeqB <= '0';
            AltB <= '0';
            AgtB <= '1';
        elsif((A(i) < B(i)) or (cAltB = '1' and cAgtB = '0' and cAeqB = '0')) then
            AeqB <= '0';
            AltB <= '1';
            AgtB <= '0';
        elsif(cAeqB = '1') then
            AeqB <= '1';
            AltB <= '0';
            AgtB <= '0';
        elsif(cAltB = '1' and cAgtB = '1') then
            AeqB <= '0';
            AltB <= '0';
            AgtB <= '0';
        else
            AeqB <= '0';
            AltB <= '1';
            AgtB <= '1';
        end if;
        
    end loop For_Loop;

end process;
end Behavioral;

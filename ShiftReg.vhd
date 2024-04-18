library ieee;
use ieee.std_logic_1164.all;
entity shiftreg4 is 
port(
clk : in bit; 
sin : in bit; 
dout : out bit_vector(3 downto 0)
); 
end entity shiftreg4;
architecture behavioral of shiftreg4 is
begin
process(clk,sin,dout) --to process tha treksei otan allaksei h timh tou clk/sin/dout
begin
if rising_edge(clk) then --sthn anodikh akmh tou rologiou
dout(2 downto 0)<= dout(3 downto 1); --metaferei ta 3 prwta bit pros ta deksia
dout(3) <= sin; --allazei to prwto bit (aristerotero) meta thn olisthish
end process;
end behavioral;

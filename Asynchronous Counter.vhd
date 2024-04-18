library ieee;
use ieee.std_logic_1164.all;
entity counter is 
port(
clk : in bit; 
reset: in bit; --reset koumpi gia asugxronh eisodo
count: out bit_vector(3 downto 0); --4bits gia na anaparastisw 15 arithmous 
addbit:in bit; --to bit pou tha prostithete sto count
); 
end entity counter;
architecture behavioral of counter is
begin
process(clk,reset,count) --to process tha treksei otan allaksei to clk/reset/count
begin
if reset = ‘1’ then --asygxronos mhdenismos
count <= “0000”;
elsif rising_edge(clk) then 
count(3 downto 0) <= count(3 downto 0) + addbit;
if count(3 downto 0) = “0101” then --an to count einai 5, to kanei 10
count(3 downto 0)<=”1010”;
elseif count(3 downto 0) = “1111” then –an to count einai 15, to mhdenizei
count (3 downto 0)<=”0000”;
endif;
endif;
end process;
end behavioral

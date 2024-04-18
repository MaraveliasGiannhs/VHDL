library ieee;
use ieee.std_logic_1164.all;

entity 4bit_adder is
  port (
	a,b: in std_logic_vector(3 downto 0);
	cin: in std_logic;    	
	cout: out std_logic;
	s : out std_logic_vector(3 downto 0)
	); 
  end 4bit_adder;

architecture behavioral of 4bit_adder is 
  begin

    process (a,b)
    begin
	for i in 0 to 3 loop
	   if (a = "001" or a = "010" or a ="011" or a = "100" or a = "101" or a = "110" or a = "111") then
           	s(i) <= cin xnor b(i);
	   	cout <= cin or b(i);
	   else
	   	cout <= cin and b(i);
	   	s(i) <= cin xor b(i);
	end loop;
    end process;

end behavioral;


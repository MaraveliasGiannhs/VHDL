library ieee;
use ieee.std_logic_1164.all;
entity alarmSystem is
 port (
sensors: in std_logic_vector(3 downto 0); --eisodos 4 sensors
zone: out std_logic_vector(1 downto 0); --eksodos gia tis 4 zwnes
alarm: out std_logic -- eksodos
); 
 end alarmSystem;
architecture behavioral of alarmSystem is 
 begin
process(sensors) -- to process tha treksei kathe fora pou allaksei h timh tou sensors
 -- dhladh otan anixneutei paraviash gia kapoion apo tous 4 sensors
begin
case sensors is --elegxw 4 periptwseis(cases) gia tous 4 sensors
when “0001” => --elegxos tou sensor 1
zone<= “00”; --endeiksh ths zwnhs pou paraviastike 
-- (00=zwnh 1, 01= zwnh 2, 10= zwnh 3, 11= zwnh 4)
alarm<= ‘1’; --energopoihsh sunergiamou
when “0010” => --elegxos tou sensor 2
zone<= “01”;
alarm<= ‘1’;
when “0100” => --elegxos tou sensor 3
zone<= “10”;
alarm<= ‘1’;
when “1000” => --elegxos tou sensor 4
zone<= “11”;
alarm<= ‘1’;
when others => --se kathe allh periptwsh, 
 
zone<= “00”; -- orise to zone sto prwto
alarm<= ‘0’; -- apenergopoihse ton sunergiamo
end case;
end process;
end behavioral

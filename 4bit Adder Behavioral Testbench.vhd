--------------------TESTBENCH---------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY 4bit_adder_tb IS
END 4bit_adder_tb;
 
ARCHITECTURE behavioral OF 4bit_adder_tb IS
 
 COMPONENT 4bit_adder 
 PORT(
	a,b: in std_logic_vector(3 downto 0);
	cin: in std_logic;    	
	cout: out std_logic;
	s : out std_logic_vector(3 downto 0)
     );
 END COMPONENT;
 
 
 signal a: std_logic_vector(3 downto 0) := "0000";
 signal b: std_logic_vector(3 downto 0) := "0000";
 signal cin: std_logic := '0';
 signal cout: std_logic := '0';
 signal s : std_logic_vector(3 downto 0) := "0000";
 
BEGIN
 uut: F PORT MAP (
 a => a,
 b => b,
 cin => cin,
 cout => cout,
 s => s
 );
 


 stim: process
 begin

 wait for 100 ns;
 
 a <= "0110";   
 b <= "0001"; 	--s=0111
 cin <= '0';
 wait for 10 ns;

 a <= "0010";   
 b <= "0001"; 	--s=0100
 cin <= '1';
 wait for 10 ns;


 
 end process;
 
END;

---pinakas

cin b  a    s  cout
0   0  0    0  0
0   0  1    1  0
0   1  0    1  0 
0   1  1    0  1 
1   0  0    1  0
1   0  1    0  1
1   1  0    0  1
1   1  1    1  1

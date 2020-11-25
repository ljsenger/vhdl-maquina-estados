library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity cafe_tb is 
end cafe_tb;


architecture behavioral of cafe_tb is
	signal clock_50: std_logic;
	signal entrada: std_logic_vector ( 1 downto 0);
	signal saida: std_logic_vector ( 2 downto 0);
	signal estado: std_logic_vector ( 1 downto 0);
	signal reset: std_logic:='0';


begin
U1: entity work.cafe PORT MAP (clock_50, reset, entrada, saida, estado);

relogio: process 
begin
	clock_50 <= '0';
	wait for 50 ps;
	clock_50 <= '1';
	wait for 50 ps;
	
end process;


testa: process
begin
	entrada <= "00";
	reset <= '1';
	wait for 100 ps;
	reset <= '0';

	
	entrada <= "01";
	wait for 400 ps;
	
	entrada <= "10";
	wait for 200 ps;

	entrada <= "11";
	wait for 100 ps;
		
	entrada <= "10";
	wait for 100 ps;
	entrada <= "11";
	wait for 100 ps;
	




end process;

end behavioral;
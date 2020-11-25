library IEEE;
use ieee.std_logic_1164.all;

entity cafe is
port (	clk: in std_logic;
	reset: in std_logic;
      	moeda: in std_logic_vector ( 1 downto 0);
     	 saidas: out std_logic_vector (2 downto 0);
      	estadosaida: out std_logic_vector (1 downto 0));

end cafe;


architecture behavioral of cafe is
	type estado is (a,b,c,d);
	signal estadoAtual, proximoEstado: estado;
	signal temp: std_logic_vector (2 downto 0):= "000";
	
begin
sincrono: process(clk, reset)
 begin
	if reset = '1' then 
		estadoAtual <= a;
	elsif rising_edge(clk) then
     		estadoAtual <= proximoEstado;
		
  	end if;
end process sincrono;

cafe: PROCESS (moeda, estadoAtual)
begin
	saidas <= "000";

	case estadoAtual is
            when a =>
                if(moeda = "00") then
                    proximoEstado <= a;			
                elsif(moeda = "01") then
                    proximoEstado <= b;		    
                elsif(moeda = "10") then
                    proximoEstado <= c;			
		elsif(moeda = "11") then
		    saidas <= "100";
                    proximoEstado <= a;
                end if;
        when b =>
                if(moeda = "00") then
                    proximoEstado <= b;
                elsif(moeda = "01") then
                    proximoEstado <= c;
                elsif(moeda = "10") then
                    proximoEstado <= d;
		elsif(moeda = "11") then
		    saidas <= "101";
                    proximoEstado <= a;
                end if;
	when c =>
                if(moeda = "00") then
                    proximoEstado <= c;
                elsif(moeda = "01") then
                    proximoEstado <= d;
                elsif(moeda = "10") then
                    saidas <= "100";
                    proximoEstado <= a;
		elsif(moeda = "11") then
		    saidas <= "110";
                    proximoEstado <= a;
                end if;
	when d =>
                if(moeda = "00") then
                    proximoEstado <= d;
                elsif(moeda = "01") then
                    proximoEstado <= a;
			saidas <= "100";
                elsif(moeda = "10") then
                    saidas <= "101";
                    proximoEstado <= a;
		 elsif(moeda = "11") then
		  saidas <= "111";
                    proximoEstado <= a;
                end if;			 
        end case;  
     
END PROCESS cafe;


estadosaida <= "00" when estadoAtual = a else
	"01" when estadoAtual = b else
	"10" when estadoAtual = c else
	"11" when estadoAtual = d;

end behavioral;

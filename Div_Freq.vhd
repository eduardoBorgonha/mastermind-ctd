library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--para uso com o clock de 500Hz do FPGAEmu (CLK_500Hz)

entity Div_Freq is
	port (	clk: in std_logic;
			reset: in std_logic;
			CLK_1Hz, sim_2hz: out std_logic
			);
end Div_Freq;

architecture divisor of Div_Freq is
	signal cont: std_logic_vector(11 downto 0); -- Registra valor da contagem
	
	begin
		P1: process(clk, reset, cont) --clock 500Hz
		begin
			
			 if reset= '1' then
				 cont <= x"000";
				 CLK_1Hz <= '0';
				 sim_2hz <= '0';
				 
			 elsif clk'event and clk = '1' then

				
				--1Hz = 1s = 500Hzx1 = 500
				if cont < x"0F9" then  --se contador < 249 (0F9 em hexadecimal)
					sim_2hz <= '0';
					clk_1Hz <='0';
					cont <= cont + 1;
					
				elsif cont < x"1F3" then  --se contador < 499 (1F3 em hexadecimal)
					CLK_1Hz <= '0';
					sim_2hz <= '1';
					cont <= cont + 1;
				
				else  
					cont <= x"000";
					CLK_1Hz <= '1';
					sim_2hz <= '1';
					
				end if;
			 end if;
		end process;
			
end architecture;

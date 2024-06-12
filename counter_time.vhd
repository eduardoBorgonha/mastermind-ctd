library ieee;
use ieee.std_logic_1164.all;
entity counter_time is port(
clock: in std_logic;
reset: in std_logic;
contagem: out std_logic_vector(3 downto 0)
);
end counter_time;

architecture bhv of counter_time is
type STATES is (E0, E1, E2, E3, E4);
signal EA, PE: STATES;

begin

P1: process(clock, reset)
begin
	if reset= '0' then
		EA <= E0;
	elsif clock'event and clock= '0' then
		EA <= PE;
	end if;
end process;

P2: process(EA)

begin
case EA is

	when E0 =>
		contagem <= "1001"; --9
		PE <= E1;
		
	when E1 =>
		contagem <= "1000"; --8 
		PE <= E2;
		
	when E2 =>
		contagem <= "0111"; --7
		PE <= E3;
		
	when E3 =>
		contagem <= "0110"; --6
		PE <= E4;
		
	when E4 =>
		contagem <= "0101"; --5
		PE <= E5;
		
	when E5 =>
		contagem <= "0100"; --4
		PE <= E6;
		
	when E6 =>
		contagem <= "0011"; --3
		PE <= E7;
		
	when E7 =>
		contagem <= "0010"; --2
		PE <= E8;
		
	when E8 =>
		contagem <= "0001"; --1
		PE <= E9;
		
	when E9 =>
		contagem <= "0000"; --0
		PE <= E0;
		
end case;
end process;
end bhv;
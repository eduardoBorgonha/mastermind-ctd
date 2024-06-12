library ieee;
use ieee.std_logic_1164.all;
entity counter_round is port(
clock: in std_logic;
reset: in std_logic;
contagem: out std_logic_vector(3 downto 0)
);
end counter_round;

architecture bhv of counter_round is
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
		contagem <= "0000";--round 0
		PE <= E1;
		
	when E1 =>
		contagem <= "0001"; --round 1
		PE <= E2;
		
	when E2 =>
		contagem <= "0010"; --round 2
		PE <= E3;
		
	when E3 =>
		contagem <= "0011"; --round 3
		PE <= E4;
		
	when E4 =>
		contagem <= "0100"; --round 4
		PE <= E5;
		
	when E5 =>
		contagem <= "0101"; --round 5
		PE <= E6;
		
	when E6 =>
		contagem <= "0110"; --round 6
		PE <= E7;
		
	when E7 =>
		contagem <= "0111"; --round 7
		PE <= E8;
		
	when E8 =>
		contagem <= "1000"; --round 8
		PE <= E9;
		
	when E9 =>
		contagem <= "1001"; --round 9
		PE <= E10;
		
	when E10 =>
		contagem <= "1010"; --round 10
		PE <= E11;
		
	when E11 =>
		contagem <= "1011"; --round 11
		PE <= E12;
		
	when E12 =>
		contagem <= "1100"; --round 12
		PE <= E13;
		
	when E13 =>
		contagem <= "1101"; --round 13
		PE <= E14;
		
	when E14 =>
		contagem <= "1110"; --round 14
		PE <= E15;
		
	when E15 =>
		contagem <= "1111"; --round 15
		PE <= E0;--retorna ao round 0
		
end case;
end process;
end bhv;
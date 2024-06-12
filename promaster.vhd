library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_unsigned.all; -- necessário para o +

entity promaster is
port(
CLOCK_50:in std_logic;
--CLK_500Hz:in std_logic;
--RKEY:in std_logic_vector(3 downto 0);
KEY:in std_logic_vector(3 downto 0);
--RSW:in std_logic_vector(17 downto 0);
SW:in std_logic_vector(17 downto 0);
LEDR:out std_logic_vector(17 downto 0);
HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7: out std_logic_vector(6
downto 0));
end promaster;

architecture circuito of promaster is
signal R1,R2,E1,E2,E3,E4,E5,end_game,end_time,end_round,Enter,Reset:std_logic;

	component datapath is 
	port (S: in std_logic_vector(15 downto 0); -- dos switches
      clk,R1,R2,E1,E2,E3,E4,E5: in std_logic;
      end_game, end_time, end_round: out std_logic;
		HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0: out std_logic_vector(6 downto 0);
		LED:out std_logic_vector(15 downto 0));
	end component;
	
	component controle is 
	port(clock,K1,K0,endtime,endgame,endround: in std_logic;			  
		  R1,R2,E1,E2,E3,E4,E5: out std_logic);
	end component;
	
	component ButtonSync is
	port(
    KEY0, KEY1, CLK: in  std_logic;
    Enter, Reset   : out std_logic);
	end component;
	
	begin	
	BOT: ButtonSync port map (KEY(0),KEY(1),CLOCK_50,Enter, Reset); --CLK??
	DATA: datapath port map (SW(15 downto 0),CLOCK_50,R1,R2,E1,E2,E3,E4,E5,end_game, end_time, end_round,HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0,LEDR(15 downto 0));
	CTRL: controle port map (CLOCK_50,Enter, Reset,end_time,end_game, end_round, R1,R2,E1,E2,E3,E4,E5);	
	
	end circuito;	
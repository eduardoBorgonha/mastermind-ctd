library ieee;
use ieee.std_logic_1164.all;
entity registrador3 is port (
	CLK, RST: in std_logic;
	D: in std_logic_vector(15 downto 0);
	Q: out std_logic_vector(15 downto 0);
	EN: in std_logic
);
end registrador3;
architecture behv of registrador3 is
begin
	process(CLK, RST)
	begin
		if RST = '0' then
			Q <= "000";
		elsif (CLK'event and CLK = '1') then
			if (EN = '0') then
				Q <= D;
			end if;
		end if;
	end process;
end behv;
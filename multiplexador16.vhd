library IEEE;
use IEEE.Std_Logic_1164.all;

entity multiplexador16 is
port (F1, F2, F3, F4: in std_logic_vector(15 downto 0);
Sel: in STD_logic_vector(1 downto 0);
F: out std_logic_vector(15 downto 0)
);
end multiplexador16;

architecture circuito of multiplexador16 is
begin

F <= F1 when Sel = "00" else
		F2 when Sel = "01" else
		F3 when Sel  = "10" else
		F4;
end circuito;
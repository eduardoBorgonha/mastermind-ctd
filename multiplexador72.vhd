library IEEE;
use IEEE.Std_Logic_1164.all;

entity multiplexador72 is
port (F1, F2: in std_logic_vector(6 downto 0);
Sel: in STD_logic;
F: out std_logic_vector(6 downto 0)
);
end multiplexador72;

architecture circuito of multiplexador72 is
begin

F <= F1 when Sel = "0" else
		F2;
end circuito;
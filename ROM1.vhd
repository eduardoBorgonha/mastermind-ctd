library ieee;
use ieee.std_logic_1164.all;

entity ROM1 is port (

    address : in  std_logic_vector(3 downto 0);
    data    : out std_logic_vector(15 downto 0));
    
end ROM1;

architecture Rom_Arch of ROM1 is

type memory is array (00 to 15) of std_logic_vector(15 downto 0);
constant my_Rom : memory := (

	00 => "0001010000010011",  --1 4 1 3   
	01 => "0100010000010101",  --4 4 1 5   
    02 => "0011001001010101",  --3 2 5 5
	03 => "0011010101010100",  --3 5 5 4
	04 => "0001010101000011",  --1 5 4 3
	05 => "0100000101010000",  --4 1 5 0
	06 => "0000010000110101",  --0 4 3 5
	07 => "0100000101000001",  --4 1 4 1
	08 => "0011010001010000",  --3 4 5 0
	09 => "0101001000110011",  --5 2 3 3
    10 => "0000010000000000",  --0 4 0 0
	11 => "0100010000010010",  --4 4 1 2
	12 => "0000000000100000",  --0 0 2 0
	13 => "0010010100100011",  --2 5 2 3
	14 => "0000000001010000",  --0 0 5 0
	15 => "0010001100000101"); --2 3 0 5
	 
	
begin
   process (address)
   begin
       case address is
            when "0000" => data <= my_rom(00);
            when "0001" => data <= my_rom(01);
            when "0010" => data <= my_rom(02);
            when "0011" => data <= my_rom(03);
            when "0100" => data <= my_rom(04);
            when "0101" => data <= my_rom(05);
            when "0110" => data <= my_rom(06);
            when "0111" => data <= my_rom(07);
            when "1000" => data <= my_rom(08);
            when "1001" => data <= my_rom(09);
            when "1010" => data <= my_rom(10);
            when "1011" => data <= my_rom(11);
            when "1100" => data <= my_rom(12);
            when "1101" => data <= my_rom(13);
            when "1110" => data <= my_rom(14);
            when others => data <= my_rom(15);
        end case;
    end process;
end architecture Rom_Arch;
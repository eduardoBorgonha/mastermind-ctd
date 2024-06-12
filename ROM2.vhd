library ieee;
use ieee.std_logic_1164.all;

entity ROM1 is port (

    address : in  std_logic_vector(3 downto 0);
    data    : out std_logic_vector(15 downto 0));
    
end ROM1;

architecture Rom_Arch of ROM1 is

type memory is array (00 to 15) of std_logic_vector(15 downto 0);
constant my_Rom : memory := (

	00 => "0100001001010110",  --4 2 5 6    
	01 => "0010001000110010",  --2 2 3 2   
    02 => "0110000101100000",  --6 1 6 0
	03 => "0011000001010101",  --3 0 5 5
	04 => "0110010001010001",  --6 4 5 1
	05 => "0101010001010000",  --5 4 5 0
	06 => "0101001001010011",  --5 2 5 3
	07 => "0001010001000001",  --1 4 4 1
	08 => "0001011100010110",  --1 7 1 6
	09 => "0100010100100001",  --4 5 2 1
    10 => "0100011000000110",  --4 6 0 6
	11 => "0100010000000100",  --4 4 0 4
	12 => "0001001001100010",  --1 2 6 2
	13 => "0000011000010001",  --0 6 1 1
	14 => "0101001000110000",  --5 2 3 0
	15 => "0000010001010101"); --0 4 5 5
	 
	
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
library ieee;
use ieee.std_logic_1164.all;

entity ROM1 is port (

    address : in  std_logic_vector(3 downto 0);
    data    : out std_logic_vector(15 downto 0));
    
end ROM1;

architecture Rom_Arch of ROM1 is

type memory is array (00 to 15) of std_logic_vector(15 downto 0);
constant my_Rom : memory := (

	00 => "0101011001011001",  --5 6 5 9    
	01 => "0001001000001000",  --1 2 0 8   
    02 => "1000001000100110",  --8 2 2 6
	03 => "1000011010011000",  --8 6 9 8
	04 => "1000010010001001",  --8 4 8 9
	05 => "1001001101010100",  --9 3 5 4
	06 => "0100001110011000",  --4 3 9 8
	07 => "0011011101011001",  --3 7 5 9
	08 => "0001011101000101",  --1 7 4 5
	09 => "0010010000100010",  --2 4 2 2
    10 => "0111001001111000",  --7 2 7 8
	11 => "0010010101101001",  --2 5 6 9
	12 => "0001100101000011",  --1 9 4 3
	13 => "0000100101001001",  --0 9 4 9
	14 => "0001010010001000",  --1 4 8 8
	15 => "0000011101101001"); --0 7 6 9
	 
	
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
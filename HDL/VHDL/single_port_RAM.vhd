library ieee;

use ieee.std_logic_1164.all;

use ieee.numeric_std.all;

use ieee.numeric_bit_unsigned.all;

USE IEEE.STD_LOGIC_UNSIGNED.ALL;

use ieee.std_logic_textio.all;

use std.textio.all;

use work.all; 
ENTITY RAM128_32 IS
	PORT
	(
		address	: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END RAM128_32;

architecture behavioural of RAM128_32 is

type array_type is array (0 to 2**6) of std_logic_vector (31 downto 0);

signal array_reg : array_type ;
signal data_reg : std_logic_vector(31 downto 0);

begin

process(clock,wren)

begin

--if(falling_edge(clock)) then

if(wren = '1') then

--array_reg(to_integer(unsigned(address))) <= data;
--data_reg <= array_reg(to_integer(unsigned(address)));
data_reg <= data;
q <= data_reg;

else 

data_reg <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
q <= data_reg;


end if;

--end if;



end process;

end architecture ;
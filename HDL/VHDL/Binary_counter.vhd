LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use IEEE.std_logic_unsigned.all;

entity AAC2M2P1 is port (                 	
   CP: 	in std_logic; 	-- clock
   SR:  in std_logic;  -- Active low, synchronous reset
   P:    in std_logic_vector(3 downto 0);  -- Parallel input
   PE:   in std_logic;  -- Parallel Enable (Load)
   CEP: in std_logic;  -- Count enable parallel input
   CET:  in std_logic; -- Count enable trickle input
   Q:   out std_logic_vector(3 downto 0);            			
    TC:  out std_logic  -- Terminal Count
);            		
end AAC2M2P1;

architecture code of AAC2M2P1 is
signal t : std_logic_vector(3 downto 0);

begin 
counter : process (CP , SR, P, PE, CEP, CET)
begin 
if (CP ='1' and SR = '0') then 
		t <= "0000";
else 
	if (CP ='1' and SR = '1' and CEP = '0' and CET = '0' and PE = '1') then
		t <= P;
	elsif (CP = '1' and SR = '1' and CEP = '1' and CET = '1' and PE = '1') then 
		t <= t  + 1  ;
	end if;
	Q <=  t;
	if ( t = "1111") then
		TC <= '1';
	else 
		TC <= '0';
	end if;
end if;

end process counter;

end code;
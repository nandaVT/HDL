
library ieee;

use ieee.std_logic_1164.all;

entity FSM is

port (In1: in std_logic;

RST: in std_logic;

CLK: in std_logic;

Out1 : inout std_logic);

end FSM;

architecture fsm_arch of FSM is

type state_type is (a,b,c);

signal PS,NS : state_type;

begin

sync_proc: process(CLK,RST)

begin

if (RST = '1') then PS <= a;

elsif (rising_edge(CLK) and rst='0') then PS <= NS;

end if;

end process sync_proc;

comb_proc: process(PS,In1)

begin

out1<= '0';

case PS is

when A =>

out1<= '0';

if in1 ='0' then NS<=A;

ELSE NS<=B;

END IF;

WHEN B =>

OUT1<= '0';

IF IN1 = '1' THEN NS<=B;

ELSE NS<=C;

END IF;

WHEN C =>

OUT1<= '1';

IF IN1 = '0' THEN NS<=C;

ELSE NS<=A;

END IF;

WHEN OTHERS =>

OUT1<='0';

NS<=A;

END CASE;

END PROCESS COMB_PROC;

END FSM_ARCH;
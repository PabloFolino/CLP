library IEEE;
use IEEE.std_logic_1164.all;

entity rest1b is
	port(
		a_i: in std_logic;
		b_i: in std_logic;
		c_i: in std_logic;
		r_o: out std_logic;
		c_o: out std_logic
	);
end;

architecture rest1b_arq of rest1b is
begin

	r_o <= a_i xor b_i xor c_i ;
	c_o <= (not(a_i) and b_i) or (not(a_i) and c_i) or (b_i and c_i);
	
end;

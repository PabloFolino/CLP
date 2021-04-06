library IEEE;
use IEEE.std_logic_1164.all;

entity sum_rest1b is
	port(
		a_i: in std_logic;
		b_i: in std_logic;
		c_i: in std_logic;
		sr_i: in std_logic;
		s_o: out std_logic;
		c_o: out std_logic
	);
end;

architecture sum_rest1b_arq of sum_rest1b is
begin
    -- Si sr='0' --> suma, y si  sr='1'--> resta
	s_o <= (a_i xor (b_i xor c_i)) 
		when sr_i='0' 
			else (not(a_i) xor (b_i xor c_i ));
	c_o <= ((a_i and b_i) or (a_i and c_i) or (b_i and c_i))
		when sr_i='0'
			else (((not a_i) and (c_i)) or ((not a_i) and b_i) or (b_i and c_i));
end;

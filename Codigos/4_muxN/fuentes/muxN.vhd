library IEEE;
use IEEE.std_logic_1164.all;

entity muxN is
	generic(
		N: integer := 4;  --N:=2**M;
		M: integer := 2
		);
	port(
		ent_i: 	in std_logic_vector(N-1 downto 0);
		sel_i: 	in std_logic_vector(M-1 downto 0);
		sal_o: 	out std_logic
	);
end;

architecture muxN_arq of muxN is
	function word_to_int(word: std_logic_vector) return integer is
		variable result : integer := 0;
	begin
		for index in word'RANGE loop
			if (word(index) = '1') then
			result := result + 2**index;
			end if;
		end loop;
		return result;
	end word_to_int;	

begin
	sal_o <= ent_i(word_to_int(sel_i));
end;




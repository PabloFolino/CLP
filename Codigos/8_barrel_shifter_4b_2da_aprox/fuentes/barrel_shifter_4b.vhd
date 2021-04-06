library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.numeric_std.all;

entity barrel_shifter_4b is
	generic (
		N: natural := 4;
		M: natural :=2
	);
	port (
		s_i: in std_logic_vector(M-1 downto 0);
		d_i: in std_logic_vector(N-1 downto 0);
		y_o: out std_logic_vector(N-1 downto 0)
	);
end;


architecture barrel_shifter_4b_arq of barrel_shifter_4b is
	
	signal yo_aux: std_logic_vector(N-1 downto 0);
	signal aux: std_logic;

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

	shift_p: process(s_i) is
		begin
		if s_i'event then
			test1: for i in 0 to word_to_int(s_i) loop
					-- Copio la entrada
					yo_aux <= d_i;
					--Guardo el último valor del vector
					aux <= yo_aux(N-1);
					test2:for j in 0 to N-2 loop
						yo_aux(j+1) <= yo_aux(j);
					end loop test2;
					--Recupero el último valor
					yo_aux(0) <= aux ;
				end loop test1;
			--copio los valores en la salida
			y_o <= yo_aux;				
		end if;
	end process;
end;


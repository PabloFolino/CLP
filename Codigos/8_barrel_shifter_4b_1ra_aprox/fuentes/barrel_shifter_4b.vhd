library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

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
	
begin

	shift_p: process(s_i) is
		begin
		if s_i'event then
			if s_i="00" then
				y_o(0) <= d_i(0);
				y_o(1) <= d_i(1);
				y_o(2) <= d_i(2);
				y_o(3) <= d_i(3);
				elsif s_i="01" then
					y_o(0) <= d_i(3);
					y_o(1) <= d_i(0);
					y_o(2) <= d_i(1);
					y_o(3) <= d_i(2);
				elsif s_i="10" then
					y_o(0) <= d_i(2);
					y_o(1) <= d_i(3);
					y_o(2) <= d_i(0);
					y_o(3) <= d_i(1);	
				else
				y_o(0) <= d_i(1);
				y_o(1) <= d_i(2);
				y_o(2) <= d_i(3);
				y_o(3) <= d_i(0);
			end if;
		end if;	
	end process;
end;

